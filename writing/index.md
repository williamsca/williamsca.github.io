---
layout: default
title: "Writing"
permalink: /writing/
description: "Blog posts and essays by Colin Williams"
---

<style>
.post-list {
  width: 55%;
  margin-left: 12.5%;
  margin-top: 0;
  margin-bottom: 0;
  margin-right: 0;
  padding: 0;
}


.post-item {
  margin-bottom: 0rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #eee;
}

.post-item:last-child {
  border-bottom: none;
}

.post-link {
  display: flex;
  gap: 1rem;
  align-items: flex-start;
  text-decoration: none;
  color: inherit;
  padding: 1rem;
  margin: -1rem;
  border-radius: 3px;
  transition: background-color 0.2s ease;
}

.post-link:hover {
  background-color: rgba(0, 0, 0, 0.02);
}

.post-content {
  flex: 1;
}

.post-image {
  flex-shrink: 0;
  width: 140px;
  height: 140px;
  border-radius: 4px;
  overflow: hidden;
  order: 2;
}

.post-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.post-title {
  font-size: 1.8rem;
  font-weight: 400;
  line-height: 1.3;
  margin-bottom: 0.8rem;
  margin-top: 0;
}

.post-title a {
  text-decoration: none;
  color: inherit;
}

.post-excerpt {
  font-size: 1.4rem;
  line-height: 1.6;
  color: #555;
  margin: 0;
}

@media (prefers-color-scheme: dark) {
  .post-item {
    border-bottom-color: #333;
  }
  
  .post-link:hover {
    background-color: rgba(255, 255, 255, 0.03);
  }
  
  .post-excerpt {
    color: #aaa;
  }
}

@media (max-width: 760px) {
  section .post-list {
    width: 100%;
    margin-left: 0;
  }
  
  .post-link {
    flex-direction: column;
    gap: 0rem;
  }
  
  .post-image {
    order: -1;
    width: 100%;
    height: 160px;
  }
  
  .post-title {
    font-size: 1.6rem;
  }
}
</style>

<h2>Writing</h2>

<div class="post-list">
{% for post in site.posts %}
  <article class="post-item">
    <a href="{{ post.url | relative_url }}" class="post-link">
      <div class="post-content">
        <h2 class="post-title">{{ post.title | escape }}</h2>
        <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 40 }}</p>
      </div>
      
      {% if post.image %}
      <div class="post-image">
        <img src="{{ post.image | relative_url }}" alt="{{ post.title | escape }}">
      </div>
      {% endif %}
    </a>
  </article>
{% endfor %}
</div>