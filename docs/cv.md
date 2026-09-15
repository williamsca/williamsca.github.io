# CV Notes

The HTML CV lives at `/cv/` and is rendered from [cv.md](/home/colin/Documents/williamsca.github.io/cv.md).

Content sources:

- Papers come from [`_papers/`](/home/colin/Documents/williamsca.github.io/_papers). Their `status:` values place them under Publications, Working Papers, or Other Publications; an optional `link:` makes the title clickable in both CV versions.
- Presentations come from [`_presentations/`](/home/colin/Documents/williamsca.github.io/_presentations). They are grouped by year on the page. Any presentation with a future `date:` gets a `†` marker and is labeled scheduled in the legend.
- Courses come from [`_courses/`](/home/colin/Documents/williamsca.github.io/_courses), with one Markdown file per course. They populate `/teaching/` and the PDF's Teaching Experience section before awards; they do not appear on the HTML CV. Each file uses `title`, `order`, `institution`, `term`, `role`, and an `instructors` list (`name` and optional `link`). Optional `note` supplies the teaching page's margin note, and `head_ta_term` identifies Head TA service in the PDF. Both outputs sort by `order`.
- Education, fields of interest, awards, PDF link, experience, and committee live in [`_data/cv.yml`](/home/colin/Documents/williamsca.github.io/_data/cv.yml). Experience entries can use `link_text:` and `link:` to link part of their detail in both CV versions.

PDF build:

- Run `./scripts/build_cv_pdf.sh`.
- That script uses [`scripts/render_cv_markdown.rb`](/home/colin/Documents/williamsca.github.io/scripts/render_cv_markdown.rb) to assemble markdown from `_papers`, `_presentations`, `_courses`, and `_data/cv.yml`.
- The generated PDF is written to [`assets/files/colin-williams-cv.pdf`](/home/colin/Documents/williamsca.github.io/assets/files/colin-williams-cv.pdf).

Current setup:

- The HTML button at the top of `/cv/` links to the generated PDF through `pdf_url` in `_data/cv.yml`.
- The old `/research/` route redirects to `/cv/`.
