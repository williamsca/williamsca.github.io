# CV Notes

The HTML CV lives at `/cv/` and is rendered from [cv.md](/home/colin/Documents/williamsca.github.io/cv.md).

Content sources:

- Papers come from [`_papers/`](/home/colin/Documents/williamsca.github.io/_papers). Their `status:` values place them under Publications, Working Papers, or Other Publications; an optional `link:` makes the title clickable in both CV versions.
- Presentations come from [`_presentations/`](/home/colin/Documents/williamsca.github.io/_presentations). They are grouped by year on the page. Any presentation with a future `date:` gets a `†` marker and is labeled scheduled in the legend.
- Education, fields of interest, awards, PDF link, and committee live in [`_data/cv.yml`](/home/colin/Documents/williamsca.github.io/_data/cv.yml).

PDF build:

- Run `./scripts/build_cv_pdf.sh`.
- That script uses [`scripts/render_cv_markdown.rb`](/home/colin/Documents/williamsca.github.io/scripts/render_cv_markdown.rb) to assemble markdown from the same `_papers`, `_presentations`, and `_data/cv.yml` sources.
- The generated PDF is written to [`assets/files/colin-williams-cv.pdf`](/home/colin/Documents/williamsca.github.io/assets/files/colin-williams-cv.pdf).

Current setup:

- The HTML button at the top of `/cv/` still links to Dropbox. When ready, replace `pdf_url` in `_data/cv.yml` with the local PDF path.
- The old `/research/` route redirects to `/cv/`.
