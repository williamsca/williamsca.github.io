#!/usr/bin/env ruby

require "yaml"
require "date"

ROOT = File.expand_path("..", __dir__)

def read_front_matter(path)
  content = File.read(path)
  match = content.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  return {} unless match

  YAML.safe_load(match[1], permitted_classes: [Date], aliases: false) || {}
end

def load_collection(glob)
  Dir.glob(File.join(ROOT, glob)).sort.map { |path| read_front_matter(path) }
end

def parse_date(value)
  case value
  when Date
    value
  when Time, DateTime
    value.to_date
  when String
    Date.parse(value)
  else
    nil
  end
rescue ArgumentError
  nil
end

def paper_line(paper, publication: false)
  parts = [paper.fetch("title")]
  if paper["coauthors"] && !paper["coauthors"].empty?
    parts << "with #{paper['coauthors']}"
  end
  if publication && paper["journal"] && !paper["journal"].empty?
    year = parse_date(paper["date"])&.year
    parts << "#{paper['journal']}#{year ? ", #{year}" : ""}"
  end
  parts.join(". ")
end

def presentation_line(presentations, today)
  dated_presentations = presentations.filter_map do |entry|
    date = parse_date(entry["date"])
    next unless date

    [entry, date]
  end

  grouped = dated_presentations.group_by { |(_, date)| date.year }.sort.reverse
  grouped.map do |year, entries|
    rendered = entries.sort_by { |(_, date)| date }.map do |entry, date|
      text = entry["title"] || entry["name"]
      text += "\\textsuperscript{\\dag}" if date > today
      text
    end
    "#{year}: #{rendered.join(', ')}"
  end
end

cv = YAML.safe_load(File.read(File.join(ROOT, "_data", "cv.yml")), aliases: false)
papers = load_collection("_papers/*.md")
presentations = load_collection("_presentations/*.md")
today = Date.today

publications, works_in_progress = papers.partition { |paper| paper["journal"] && !paper["journal"].to_s.empty? }
publications.sort_by! { |paper| parse_date(paper["date"]) || Date.new(1900, 1, 1) }
publications.reverse!
works_in_progress.sort_by! { |paper| parse_date(paper["date"]) || Date.new(1900, 1, 1) }
works_in_progress.reverse!

puts <<~MARKDOWN
---
title: #{cv.fetch("name")} CV
geometry: margin=1in
fontsize: 11pt
header-includes:
  - \\usepackage{setspace}
  - \\setstretch{1.05}
---

# #{cv.fetch("name")}

#{cv.fetch("institution")}  
#{cv.fetch("department")}  
#{cv.fetch("address_lines").join("  \n")}  
#{cv.fetch("phone")}  
[#{cv.fetch("email_display")}](mailto:#{cv.fetch("email")})  
[#{cv.fetch("website")}](#{cv.fetch("website")})  
Citizenship: #{cv.fetch("citizenship")}

## Education
MARKDOWN

cv.fetch("education").each do |entry|
  puts "- #{entry.fetch('degree')}, #{entry.fetch('institution')} (#{entry.fetch('years')})"
end

puts "\n## Fields of Interest"
puts cv.fetch("fields_of_interest").join(", ")

puts "\n## Works in Progress"
if works_in_progress.empty?
  puts "None at the moment."
else
  works_in_progress.each { |paper| puts "- #{paper_line(paper)}" }
end

puts "\n## Publications"
if publications.empty?
  puts ""
else
  publications.each { |paper| puts "- #{paper_line(paper, publication: true)}" }
end

puts "\n## Presentations, Schools, and Conferences"
presentation_line(presentations, today).each { |line| puts "- #{line}" }
if presentations.any? { |entry| (date = parse_date(entry["date"])) && date > today }
  puts "\n\\textsuperscript{\\dag} Scheduled."
end

puts "\n## Awards, Grants, and Fellowships"
cv.fetch("awards").sort_by { |award| award.fetch("year") }.reverse.each do |award|
  amount = award["amount"] ? ", #{award['amount']}" : ""
  puts "- #{award.fetch('title')}, #{award.fetch('institution')}#{amount} (#{award.fetch('year')})"
end

puts "\n## References"
if cv.fetch("references").empty?
  puts cv.fetch("references_note")
else
  cv.fetch("references").each do |reference|
    parts = [reference["name"], reference["title"], reference["institution"], reference["email"]].compact
    puts "- #{parts.join(', ')}"
  end
end
