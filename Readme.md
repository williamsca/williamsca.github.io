# Colin Williams' Academic Website

## Converting to Jekyll

This document outlines the steps to convert the current static HTML site to a Jekyll-powered site for easier maintenance and better organization.

## Todo List

### Setup and Configuration
- [x] Install Jekyll and Bundler
- [x] Create Gemfile and add necessary Jekyll plugins

### Content Conversion
- [ ] Convert teaching.html to teaching.md with front matter
- [ ] Convert writing/index.html to writing/index.md with front matter
- [ ] Set up proper front matter in all pages

### Templates and Components
- [x] Create _includes/head.html (for meta tags, CSS, etc.)
- [x] Create _includes/header.html (for site navigation)
- [x] Create _includes/analytics.html (for Google Analytics)
- [ ] Create _layouts/default.html (base template)
- [ ] Create _layouts/page.html (regular pages)
- [ ] Create _layouts/post.html (blog posts)
- [ ] Create _layouts/home.html (homepage)
- [ ] Create _layouts/teaching.html (teaching pages)

### Future Improvements
- [ ] Implement tags and categories for blog posts
- [ ] Add pagination for the blog

## Reference

### Jekyll Installation

```bash
# Install Jekyll and Bundler (if not already installed)
gem install jekyll bundler

# Create Gemfile
bundle init
bundle add jekyll

# Add essential Jekyll plugins
bundle add jekyll-seo-tag
bundle add jekyll-sitemap
bundle add jekyll-feed
```

### Front Matter Example

```yaml
---
layout: page
title: "About Me"
permalink: /about/
description: "About Colin Williams, economics researcher at the University of Virginia."
---
```