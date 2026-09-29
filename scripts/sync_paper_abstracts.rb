#!/usr/bin/env ruby
# Refresh summaries at build time; checked-in summaries remain the fallback.
require "date"
require "net/http"
require "open3"
require "yaml"

root = ARGV.fetch(0, File.expand_path("..", __dir__))
Dir.glob(File.join(root, "_papers", "*.md")).sort.each do |path|
  begin
    original = File.read(path)
    front = original.match(/\A---\s*\n(.*?)\n---[^\S\n]*\n/m)
    next unless front

    metadata = YAML.safe_load(front[1], permitted_classes: [Date], aliases: false) || {}
    next if metadata["markdown"].to_s.empty?

    uri = URI(metadata.fetch("markdown"))
    raise "Markdown URL must use HTTP or HTTPS" unless uri.is_a?(URI::HTTP)

    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https",
                               open_timeout: 5, read_timeout: 10) do |http|
      http.get(uri.request_uri)
    end
    raise "HTTP #{response.code}" unless response.is_a?(Net::HTTPSuccess)

    section = response.body.match(/<!-- abstract:start -->\s*# Abstract\s*\n(.*?)<!-- abstract:end -->/m)
    raise "No marked Abstract section in Markdown" unless section

    summary, error, status = Open3.capture3("pandoc", "-f", "gfm", "-t", "plain",
                                          "--wrap=none", stdin_data: section[1])
    raise "Abstract conversion failed: #{error.strip}" unless status.success?

    summary = summary.split.join(" ")
    raise "Abstract is empty" if summary.empty?

    metadata["summary"] = summary
    # Only the build's checkout is changed; no commit or write-back is needed.
    updated = YAML.dump(metadata) + "---\n" + original[front.end(0)..-1]
    File.write(path, updated)
    puts "Refreshed abstract: #{File.basename(path)}"
  rescue StandardError => error
    warn "Keeping saved abstract for #{File.basename(path)}: #{error.message}"
  end
end
