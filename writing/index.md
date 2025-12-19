---
layout: default
title: "Writing"
permalink: /writing/
description: "Blog posts and essays by Colin Williams"
---

<section>
  <h2>Writing</h2>

  <div class="post-list">
    {% for post in site.posts %}
      <a href="{{ post.url | relative_url }}" class="post-entry-wrapper">
        <article class="post-entry">
          <h3 class="post-title">{% if post.figure %}{% include marginnote.html id=post.slug image=post.figure alt=post.figure_alt content=post.figure_caption %}{% endif %}{{ post.title }}</h3>

          {% if post.date %}
          <p class="post-meta">{{ post.date | date: "%B %Y" }}</p>
          {% endif %}

          <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 40 }}</p>
        </article>
      </a>

      {% unless forloop.last %}
      <hr class="entry-divider">
      {% endunless %}
    {% endfor %}
  </div>
</section>