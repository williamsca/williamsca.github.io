---
title: "Academic Webpage Review: Colin Williams Job Market Site"
---

## Executive Summary

Colin Williams's job market site (williamsca.github.io) is well-built for the
2026-2027 economics hiring cycle. The Tufte CSS design is clean and scholarly,
the research descriptions are substantive, and the core materials a hiring
committee needs -- CV, job market paper, references -- are all present and
reachable. The site communicates a clear identity: an urban/public economist
with a strong JMP on mobile home zoning and municipal regulation.

The highest-value changes before the market opens are:

1. **Fix the invisible profile photo on mobile.** The Tufte CSS margin-note
   pattern hides the headshot entirely on narrow screens. A committee member
   checking the site on a phone at a conference will see no photo.
2. **Add "Trade" to the homepage fields description** to match the CV, which
   lists Urban and Spatial Economics, Public Economics, and Trade.
3. **Link the JMP directly from the job market announcement**, so a reader
   does not have to scroll past the bio to find it.

Everything else is refinement, not repair.


## Page Inventory

| Page | URL | Retrieval | Inspection type |
|------|-----|-----------|-----------------|
| Homepage | williamsca.github.io | 2026-10-23 | Content scrape + desktop screenshot (1280x800) + mobile screenshot (390x844) |
| CV | williamsca.github.io/cv/ | 2026-10-23 | Content scrape + desktop screenshot (1280x800) |
| Writing | williamsca.github.io/writing/ | 2026-10-23 | Content scrape |
| Teaching | williamsca.github.io/teaching/ | 2026-10-23 | Content scrape |
| Resources | williamsca.github.io/resources/ | 2026-10-23 | Content scrape |

All pages returned HTTP 200. Key linked documents verified: JMP PDF (200, 727KB),
CV PDF (200), Impact Fees PDF (200, 361KB), JMP Markdown (200), Flat Fees slides
(Dropbox 302 redirect, normal). Content retrieved via Firecrawl; rendered
screenshots captured via uxtest with Playwright/Chromium.


## Visual Inspection

### Homepage -- Desktop (1280x800)

![Homepage at 1280x800 desktop viewport, captured 2026-10-23. Shows header navigation, bio text with profile photo in right margin, and the beginning of the job market announcement.](https://www.expectedparrot.com/api/macaw/sessions/875de058-a6f5-43cd-955a-7d6d47e985e6/files/sessions/topic_academic-webpage-review/study_a/writeup/screenshots/homepage-desktop.png?inline=true)

The desktop layout uses Tufte CSS's characteristic wide left column with a
narrower right margin for sidenotes and images. The profile photo appears in the
right margin alongside the bio text. Navigation links (CV, Writing, Teaching,
Resources) are right-aligned in the header. Typography is serif-based and
readable. The overall effect is clean and scholarly -- appropriate for an
economics job market candidate.

### Homepage -- Mobile (390x844)

![Homepage at 390x844 mobile viewport, captured 2026-10-23. Shows header with name and navigation, bio text beginning with the toggle symbol, but no profile photo visible.](https://www.expectedparrot.com/api/macaw/sessions/875de058-a6f5-43cd-955a-7d6d47e985e6/files/sessions/topic_academic-webpage-review/study_a/writeup/screenshots/homepage-mobile.png?inline=true)

On mobile, the layout collapses to a single column. The navigation items wrap
below the name. Text is readable and well-sized. However, the profile photo is
not displayed -- only the Tufte CSS margin-toggle symbol is visible. This is the
most important visual finding: a hiring committee member viewing the site on a
phone will not see Colin's face.

### CV Page -- Desktop (1280x800)

![CV page at 1280x800 desktop viewport, captured 2026-10-23. Shows CV heading with Download PDF button, Education section, and Fields of Interest.](https://www.expectedparrot.com/api/macaw/sessions/875de058-a6f5-43cd-955a-7d6d47e985e6/files/sessions/topic_academic-webpage-review/study_a/writeup/screenshots/cv-desktop.png?inline=true)

The CV page is clean and well-structured. The "Download PDF" button is
prominently placed next to the CV heading. Section headings (Education, Fields
of Interest, Working Papers, etc.) use italic serif type that is legible and
visually distinct. The layout follows the same Tufte CSS column structure as the
homepage.


## What Is Working

**Identity and positioning.** The homepage immediately communicates who Colin is:
a sixth-year PhD candidate in Economics at UVA, working in urban and public
economics. The Lincoln Institute fellowship is mentioned and linked, adding
external validation.

**Job market signal.** The bold job market statement with three named conferences
(UEA, SEA, AREUEA-ASSA) is prominent and current.

**Paper descriptions.** The abstracts are detailed and substantive. The JMP
abstract clearly states the research question, identification strategy,
key statistics, and main finding. These read like well-crafted professional
abstracts, not vague summaries.

**Machine-readable paper versions.** Offering a Markdown version of the JMP and
Impact Fees paper "for LLMs and other machine readers" is forward-thinking and
shows technical awareness.

**CV page.** Well-organized, with a prominent PDF download button. Committee
members listed with full contact information. The dagger notation for scheduled
conferences is a nice touch.

**Writing page.** The blog demonstrates intellectual breadth (Roman epigraphy,
nursing labor markets, manufactured housing productivity, book reviews). The
most relevant entries -- "Productivity in Manufactured Housing" and "The New
Dynamics of Fiscal Federalism" -- connect to the research agenda and signal
engagement with the broader field.

**Resources page.** Sharing an imputed HMDA dataset with DOI (Zenodo) and
replication code (GitHub) signals commitment to reproducibility.

**Design.** Tufte CSS is a strong choice for an academic site -- it is clean,
readable, and signals aesthetic literacy without being flashy.


## Prioritized Findings

### Now -- Fix before the market opens

**1. Profile photo invisible on mobile.**
Page: Homepage. Evidence class: **Verified defect** (mobile screenshot).
The Tufte CSS `margin-toggle` pattern hides `marginnote` content on narrow
viewports. The profile photo is inside a margin note, so it disappears on
mobile. Only the toggle symbol is visible. A committee member checking the
site on a phone at a conference, a dinner, or between talks will not see the
photo.
Fix: Move the profile image out of the `marginnote` span, or add a CSS rule
that displays it inline on small screens. This likely requires editing the
Jekyll template or adding a media query to the site's stylesheet.

**2. Homepage fields description omits "Trade."**
Page: Homepage vs. CV. Evidence class: **Verified defect** (content comparison).
The homepage says "My research in urban and public economics." The CV lists
fields of interest as "Urban and Spatial Economics, Public Economics, Trade."
Trade is missing from the homepage. This matters because some search committees
use field keywords to filter candidates, and a trade-interested department
might not click through from the homepage alone.
Fix: Add Trade to the homepage research description. Consider: "My research
in urban economics, public economics, and trade examines how state and federal
policies affect local governments..."

**3. No direct JMP link in the job market announcement.**
Page: Homepage. Evidence class: **Strategic option.**
The bold job market statement lists conferences but does not link to the paper
itself. The visitor must scroll down to the Working Papers section to find the
JMP. For a busy reader, a direct link in the announcement would reduce friction.
Fix: Add a link such as "I will present my [job market paper](<PDF-URL>) at
the following conferences."


### Next -- Strengthen before heavy traffic

**4. "Flat Fees" paper has no PDF available.**
Page: Homepage. Evidence class: **Confirm with owner.**
The "State Law, Local Finances, and Housing Markets" paper has only a Dropbox
link to 2025 SEA slides -- no full paper PDF. If this paper is circulating or
if committees might want to read it, adding a PDF link would help. If it is
not yet ready for distribution, this is fine as-is, but you might add "Draft
available upon request" to signal availability.

**5. "Retailer Congestion" paper has no links at all.**
Page: Homepage. Evidence class: **Confirm with owner.**
The co-authored paper with Yooseon Hwang has an abstract but no PDF, slides,
or Markdown link. Same consideration as above: if a committee member wants to
see the paper, there is no way to access it from the site. Consider adding a
PDF or noting availability.

**6. Paper figure images lack alt text.**
Page: Homepage. Evidence class: **Verified defect** (HTML inspection).
The margin-note images for each paper (`boundary_lumberton_nc.png`,
`event_study_sq_ft_bins_ln.png`, `exp_cap_cur_dbt_pcap.png`) all have
`alt=""`. Adding descriptive alt text (e.g., "Map showing mobile home
density at municipal boundary in Lumberton, NC") improves accessibility for
screen readers and helps search engine indexing.

**7. APPAM presentation appears only on the CV, not the homepage.**
Page: Homepage vs. CV. Evidence class: **Confirm with owner.**
The CV lists an APPAM Annual Meeting presentation for 2026 (marked as
scheduled). The homepage conference list includes only UEA, SEA, and
AREUEA-ASSA. If APPAM is for a different paper, this is correct and the
homepage is specifically about the JMP. If it is also a JMP presentation,
add it to the homepage list.


### Later -- Housekeeping and enhancements

**8. Consider adding a Google Scholar profile link.**
Page: Homepage or CV. Evidence class: **Strategic option.**
A Google Scholar link helps committees find citation counts and related work
quickly. Many candidates include this alongside their email.

**9. Page title could be more descriptive for search results.**
Page: Homepage. Evidence class: **Strategic option.**
The HTML `<title>` is "Colin Williams." When this appears in a browser tab or
Google search result, it gives no context. Consider "Colin Williams -- Economics
PhD Candidate, University of Virginia" for the homepage title. The meta
description is already good ("Colin Williams, economics researcher at the
University of Virginia focusing on urban and public economics").

**10. No last-updated date on the site.**
Page: All. Evidence class: **Strategic option.**
The footer says only "This site was built using Tufte CSS." Adding a last-updated
date (even just a month/year) signals to visitors that the content is current.
This is especially useful during the job market when committees want to know
they are seeing up-to-date information.

**11. Teaching page could be richer for teaching-focused positions.**
Page: Teaching. Evidence class: **Strategic option.**
The page lists TA positions clearly, including Head TA roles. For positions
where teaching matters heavily, adding a brief teaching statement, evaluation
scores, or a note about independent teaching experience (if any) would
strengthen this section. For research-focused positions, the current page is
adequate.


## Cross-Page Consistency

| Item | Homepage | CV | Match? |
|------|----------|-----|--------|
| Paper titles (all 4) | Present | Present | Yes |
| JMP date | September 2026 | Not dated | Compatible |
| Fields | "urban and public economics" | "Urban and Spatial Economics, Public Economics, Trade" | Partial -- Trade missing from homepage |
| Conferences | UEA, SEA, AREUEA-ASSA | UEA, SEA, AREUEA-ASSA, APPAM | Compatible if APPAM is for a different paper |
| Email | williams.colinandrew@gmail.com | Not on CV page (on PDF) | N/A |
| Coauthor link (Hwang) | Linked | Linked | Yes |
| Lincoln Institute | Linked | Listed as fellowship | Consistent |
| UEA Student Paper Prize | Listed under JMP | Not visible on CV page | Confirm whether it should appear on CV |


## Unknowns and Limitations

- **No accessibility testing performed.** The alt-text finding is from HTML
  inspection only. Keyboard navigation, screen reader behavior, and WCAG
  conformance were not tested.
- **No analytics reviewed.** Visitor counts, traffic sources, search queries,
  and time-on-page are unknown.
- **Mobile screenshot is viewport-only.** The mobile capture shows the initial
  view; scrolled sections were not captured on mobile.
- **CV PDF not inspected.** The downloadable PDF was verified to load (HTTP 200)
  but its content was not compared line-by-line against the HTML CV page.
- **Link validation was a spot-check.** The five most important links were
  verified. Links to external professors' pages and coauthor sites were not
  tested.
- **No real visitor feedback.** All assessments of how a hiring committee member
  would experience the site are inferences, not observed behavior.


## Next Actions

1. **Fix the mobile photo** (finding 1). Check where the profile image markup
   lives in the Jekyll template and add a fallback for narrow viewports.
2. **Add Trade to the homepage fields** (finding 2). One-line text edit.
3. **Link the JMP from the job market announcement** (finding 3). One-line
   markup edit.
4. **Decide on paper availability** (findings 4-5). For each paper without a
   PDF: add a link, or add "Draft available upon request."
5. **Add alt text to paper images** (finding 6). Three image tags to update.
6. **Consider adding Google Scholar link and page title update** (findings
   8-9) when convenient.


## Method

Pages were retrieved via Firecrawl (content extraction) on 2026-10-23. Rendered
screenshots were captured via uxtest (Playwright/Chromium) using gpt-4o for
browser-step decisions at desktop (1280x800) and mobile (390x844) viewports.
Key document links were verified via HTTP HEAD requests. Cross-page consistency
was checked by comparing extracted text across all five pages. The review
followed an editorial inspection rubric focused on job market readiness;
no synthetic-visitor task studies or human usability testing were performed.
Screenshots and page extracts are preserved in the study's `data/` directory.
