---
layout: page
title: "Writing"
permalink: /writing/
description: "Blog posts and essays by Colin Williams"
---

<style>
section .post-list {
  width: 55%;
  margin: 0;
  padding: 0;
}

.post-item {
  margin-bottom: 3rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #eee;
  display: flex;
  gap: 1.5rem;
  align-items: flex-start;
}

.post-item:last-child {
  border-bottom: none;
}

.post-content {
  flex: 1;
}

.post-image {
  flex-shrink: 0;
  width: 120px;
  height: 80px;
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
  transition: color 0.2s ease;
}

.post-title a:hover {
  color: #666;
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
  
  .post-excerpt {
    color: #aaa;
  }
  
  .post-title a:hover {
    color: #bbb;
  }
}

@media (max-width: 760px) {
  section .post-list {
    width: 100%;
  }
  
  .post-item {
    margin-bottom: 2rem;
    padding-bottom: 1.5rem;
    flex-direction: column;
    gap: 1rem;
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

<section>
<div class="post-list">
{% for post in site.posts %}
  <article class="post-item">
    <div class="post-content">
      <h2 class="post-title">
        <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
      </h2>
      
      <p class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 40 }}</p>
    </div>
    
    {% if post.image %}
    <div class="post-image">
      <img src="{{ post.image | relative_url }}" alt="{{ post.title | escape }}">
    </div>
    {% endif %}
  </article>
{% endfor %}
</div>
</section>