---
layout: page
title: "Writing"
permalink: /writing/
description: "Blog posts and essays by Colin Williams"
---

<section>

{% for post in site.posts %}
  <h2>
    <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
  </h2>
  
  <p>{{ post.excerpt | strip_html | truncatewords: 100 }}</p>
  
  {% unless forloop.last %}
    <hr>
  {% endunless %}
{% endfor %}

</section>