---
layout: page
title: "Teaching"
permalink: /teaching/
description: "Courses taught by Colin Williams at the University of Virginia"
---

{% assign courses = site.courses | sort: "order" %}
<section>
  <h2>Teaching Assistantships</h2>
  {% for course in courses %}
  <p>
    {% if course.note %}<span class="marginnote">{{ course.note | escape }}</span>{% endif %}
    <span class="papertitle"><b>{{ course.title | escape }}</b></span>
    <span class="coauthors"> for {% if course.instructors.size > 1 %}Professors{% else %}Professor{% endif %} {% for instructor in course.instructors %}{% unless forloop.first %}{% if forloop.last %} and {% else %}, {% endif %}{% endunless %}{% if instructor.link %}<a href="{{ instructor.link | escape }}" target="_blank" rel="noopener">{{ instructor.name | escape }}</a>{% else %}{{ instructor.name | escape }}{% endif %}{% endfor %}</span>
    <span class="paperdetails">{{ course.institution | escape }} | {{ course.term | escape }}</span>
  </p>
  {% endfor %}
</section>
