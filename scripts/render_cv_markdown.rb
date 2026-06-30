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

# Escape characters that are special in LaTeX (CV data has no ~, ^, or \).
def tex_escape(str)
  str.to_s.gsub(/([&%$#_{}])/) { "\\#{Regexp.last_match(1)}" }
end

# Render hyphenated year ranges with an en-dash ("2021-present" -> "2021--present").
def tex_years(years)
  years.to_s.gsub("-", "--")
end

def tabularx(rows, cols = "@{}X r@{}")
  return "" if rows.empty?

  (["\\begin{tabularx}{\\textwidth}{#{cols}}"] + rows + ["\\end{tabularx}"]).join("\n")
end

def paper_line(paper, publication: false)
  line = "``#{tex_escape(paper.fetch('title'))}''"
  if paper["coauthors"] && !paper["coauthors"].to_s.empty?
    line += " \\textit{with #{tex_escape(paper['coauthors'])}}"
  end
  if publication && paper["journal"] && !paper["journal"].to_s.empty?
    year = parse_date(paper["date"])&.year
    line += " \\textit{#{tex_escape(paper['journal'])}#{year ? ", #{year}" : ''}}"
  end
  line
end

def presentation_rows(presentations, today)
  dated = presentations.filter_map do |entry|
    date = parse_date(entry["date"])
    next unless date

    [entry, date]
  end

  grouped = dated.group_by { |(_, date)| date.year }.sort.reverse
  grouped.map do |year, entries|
    items = entries.sort_by { |(_, date)| date }.map do |entry, date|
      text = tex_escape(entry["title"] || entry["name"])
      text += "\\textsuperscript{\\dag}" if date > today
      text
    end
    "#{items.join(', ')} & #{year} \\\\"
  end
end

def experience_rows(entries)
  entries.map do |entry|
    left = "\\textit{#{tex_escape(entry['role'])}}, #{tex_escape(entry['detail'])}"
    right = entry["years"] ? tex_years(entry["years"]) : ""
    "#{left} & #{right} \\\\"
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

website = cv.fetch("website")
website_display = website.sub(%r{\Ahttps?://}, "").sub(%r{/\z}, "")
address = cv.fetch("address_lines")

# Header is passed to the pandoc template as metadata variables.
puts <<~MARKDOWN
---
name: "#{cv.fetch('name')}"
institution: "#{cv.fetch('institution')}"
department: "#{cv.fetch('department')}"
address1: "#{address[0]}"
address2: "#{address[1]}"
phone: "#{cv.fetch('phone')}"
email: "#{cv.fetch('email')}"
email_display: "#{cv.fetch('email_display')}"
website: "#{website}"
website_display: "#{website_display}"
citizenship: "#{cv.fetch('citizenship')}"
---

# Education

#{tabularx(cv.fetch('education').map { |e| "#{tex_escape(e.fetch('degree'))}, #{tex_escape(e.fetch('institution'))} & #{tex_years(e.fetch('years'))} \\\\" })}

# Fields of Interest

#{cv.fetch('fields_of_interest').join(', ')}
MARKDOWN

puts "\n# Works in Progress\n\n"
if works_in_progress.empty?
  puts "None at the moment."
else
  puts tabularx(works_in_progress.map { |paper| "#{paper_line(paper)} \\\\" }, "@{}X@{}")
end

puts "\n# Publications\n\n"
unless publications.empty?
  puts tabularx(publications.map { |paper| "#{paper_line(paper, publication: true)} \\\\" }, "@{}X@{}")
end

puts "\n# Presentations, Schools, and Conferences\n\n"
puts tabularx(presentation_rows(presentations, today))
if presentations.any? { |entry| (date = parse_date(entry["date"])) && date > today }
  puts "\n\\textsuperscript{\\dag} Scheduled."
end

award_rows = cv.fetch("awards").sort_by { |award| award.fetch("year") }.reverse.map do |award|
  amount = award["amount"] ? ", #{tex_escape(award['amount'])}" : ""
  "#{tex_escape(award.fetch('title'))}, #{tex_escape(award.fetch('institution'))}#{amount} & #{award.fetch('year')} \\\\"
end
puts "\n# Awards, Grants, and Fellowships\n\n"
puts tabularx(award_rows)

puts "\n# Research and Professional Experience\n\n"
puts tabularx(experience_rows(cv.fetch("research_experience")))

puts "\n# Professional Service\n\n"
puts tabularx(experience_rows(cv.fetch("professional_service")))

puts "\n# References"
if cv.fetch("references").empty?
  puts cv.fetch("references_note")
else
  cv.fetch("references").each do |reference|
    parts = [reference["name"], reference["title"], reference["institution"], reference["email"]].compact
    puts "- #{parts.join(', ')}"
  end
end
