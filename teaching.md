---
layout: page
title: "Teaching"
permalink: /teaching/
description: "Courses taught by Colin Williams at the University of Virginia"
---

## Teaching Experience

{% for teaching in site.teaching %}
  <div class="course">
    <h3><a href="{{ teaching.permalink }}">{{ teaching.title }}</a></h3>
    <p><strong>{{ teaching.role }}</strong> for {{ teaching.instructor }}, {{ teaching.venue }}</p>
    {{ teaching.content }}
  </div>
{% endfor %}