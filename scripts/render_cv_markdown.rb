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

# Escape characters special to LaTeX within a \href URL argument (e.g. Dropbox query strings).
def tex_escape_url(url)
  url.to_s.gsub(/([&%#])/) { "\\#{Regexp.last_match(1)}" }
end

def tabularx(rows, cols = "@{}X r@{}")
  return "" if rows.empty?

  (["\\begin{tabularx}{\\textwidth}{#{cols}}"] + rows + ["\\end{tabularx}"]).join("\n")
end

# Section bodies sit indented slightly beneath their (flush-left) heading.
def indent(str)
  return "" if str.to_s.strip.empty?

  "\\begin{adjustwidth}{1em}{0pt}\n#{str}\n\\end{adjustwidth}"
end

def paper_line(paper, publication: false)
  title = "``#{tex_escape(paper.fetch('title'))}''"
  url = [paper["link"], paper["pdf"]].find { |value| value && !value.to_s.empty? }
  title = "\\href{#{tex_escape_url(url)}}{#{title}}" if url
  line = title
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
    detail = tex_escape(entry["detail"])
    if entry["link"] && entry["link_text"]
      link_text = tex_escape(entry["link_text"])
      linked_text = "\\href{#{tex_escape_url(entry['link'])}}{#{link_text}}"
      detail = detail.sub(link_text) { linked_text }
    end
    left = "\\textit{#{tex_escape(entry['role'])}}, #{detail}"
    right = entry["years"] ? tex_years(entry["years"]) : ""
    "#{left} & #{right} \\\\"
  end
end

def teaching_rows(entries)
  entries.map do |entry|
    left = "#{tex_escape(entry.fetch('course'))}, #{tex_escape(entry.fetch('title'))}"
    "#{left} & #{tex_years(entry.fetch('term'))} \\\\"
  end
end

def committee_block(committee, note)
  return "Committee: #{note}" if committee.empty?

  items = committee.map do |member|
    parts = [tex_escape(member.fetch("name"))]
    parts << "\\href{mailto:#{member['email']}}{#{tex_escape(member['email'])}}" if member["email"]
    parts << tex_escape(member["phone"]) if member["phone"]
    "\\item #{parts.join(', ')}"
  end
  (["\\textbf{Committee:}", "\\begin{enumerate}\\itemsep0pt"] + items + ["\\end{enumerate}"]).join("\n")
end

cv = YAML.safe_load(File.read(File.join(ROOT, "_data", "cv.yml")), aliases: false)
papers = load_collection("_papers/*.md")
presentations = load_collection("_presentations/*.md")
today = Date.today

publications = papers.select { |paper| paper["status"] == "Publication" }
working_papers = papers.select { |paper| paper["status"] == "Working Paper" }
other_publications = papers.select { |paper| paper["status"] == "Other Publication" }
[publications, working_papers, other_publications].each do |group|
  group.sort_by! { |paper| parse_date(paper["date"]) || Date.new(1900, 1, 1) }
  group.reverse!
end

website = cv.fetch("website")
website_display = website.sub(%r{\Ahttps?://}, "").sub(%r{/\z}, "")
address = cv.fetch("address_lines")

education = cv.fetch("education")
primary_degree, remaining_degrees = education.first, education.drop(1)

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

  #{indent([
    tabularx(["#{tex_escape(primary_degree.fetch('degree'))}, #{tex_escape(primary_degree.fetch('institution'))} & #{tex_years(primary_degree.fetch('years'))} \\\\"]),
    committee_block(cv.fetch("committee"), cv.fetch("committee_note")),
    "\\vspace{0.6em}",
    tabularx(remaining_degrees.map { |e| "#{tex_escape(e.fetch('degree'))}, #{tex_escape(e.fetch('institution'))} & #{tex_years(e.fetch('years'))} \\\\" }),
    "\\vspace{0.6em}",
  ].reject(&:empty?).join("\n\n"))}

  \\textbf{FIELDS OF INTEREST:} #{cv.fetch('fields_of_interest').join(', ')}
MARKDOWN

unless publications.empty?
  puts "\n# Publications\n\n"
  puts indent(tabularx(publications.map { |paper| "#{paper_line(paper, publication: true)} \\\\" }, "@{}X@{}"))
end

puts "\n# Working Papers\n\n"
puts indent(tabularx(working_papers.map { |paper| "#{paper_line(paper)} \\\\" }, "@{}X@{}"))

unless other_publications.empty?
  puts "\n# Other Publications\n\n"
  puts indent(tabularx(other_publications.map { |paper| "#{paper_line(paper, publication: true)} \\\\" }, "@{}X@{}"))
end

puts "\n# Presentations, Schools, and Conferences\n\n"
puts indent(tabularx(presentation_rows(presentations, today)))
if presentations.any? { |entry| (date = parse_date(entry["date"])) && date > today }
  puts "\n\\textsuperscript{\\dag} Scheduled."
end

award_rows = cv.fetch("awards").sort_by { |award| award.fetch("year") }.reverse.map do |award|
  amount = award["amount"] ? ", #{tex_escape(award['amount'])}" : ""
  "#{tex_escape(award.fetch('title'))}, #{tex_escape(award.fetch('institution'))}#{amount} & #{award.fetch('year')} \\\\"
end
puts "\n# Awards, Grants, and Fellowships\n\n"
puts indent(tabularx(award_rows))

puts "\n# Research and Professional Experience\n\n"
puts indent(tabularx(experience_rows(cv.fetch("research_experience"))))

puts "\n# Professional Service\n\n"
puts indent(tabularx(experience_rows(cv.fetch("professional_service"))))

teaching_experience = cv.fetch("teaching_experience")
unless teaching_experience.empty?
  puts "\n# Teaching Experience\n\n"
  puts indent(tabularx(teaching_rows(teaching_experience)))
end
