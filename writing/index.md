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

          {%- comment -%}
          Drop sidenote/marginnote spans so footnote text stays out of the excerpt.
          {%- endcomment -%}
          {%- assign excerpt_text = post.excerpt -%}
          {%- assign note_markers = '<span class="sidenote">,<span class="marginnote">' | split: "," -%}
          {%- for marker in note_markers -%}
            {%- assign chunks = excerpt_text | split: marker -%}
            {%- capture excerpt_text -%}
              {%- for chunk in chunks -%}
                {%- if forloop.first -%}
                  {{- chunk -}}
                {%- else -%}
                  {%- assign after_note = chunk | split: '</span>' -%}
                  {%- for piece in after_note offset: 1 -%}{{ piece }}{%- endfor -%}
                {%- endif -%}
              {%- endfor -%}
            {%- endcapture -%}
          {%- endfor -%}

          <p class="post-excerpt">{{ excerpt_text | strip_html | truncatewords: 40 }}</p>
        </article>
      </a>

      {% unless forloop.last %}
      <hr class="entry-divider">
      {% endunless %}
    {% endfor %}
  </div>
</section>