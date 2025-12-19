---
layout: default
title: "Research"
permalink: /research/
description: "Research"
---

<section>
    <h2> Selected Research </h2>
    {% assign sorted_papers = site.papers | sort: 'date' | reverse %}
    {% for paper in sorted_papers %}
    <article class="paper-entry">
        <!-- Title -->
        <h3 class="paper-title">{% if paper.figure %}{% include marginnote.html id=paper.slug image=paper.figure
            alt=paper.figure_alt content=paper.figure_caption %}{% endif %}{{ paper.title }}</h3>

        <!-- Coauthors line -->
        {% if paper.coauthors %}
        <p class="paper-coauthors">
            with {% if paper.coauthor_url %}
            <a href="{{ paper.coauthor_url }}" target="_blank" rel="noopener">{{ paper.coauthors }}</a>
            {% else %}
            {{ paper.coauthors }}
            {% endif %}
        </p>
        {% endif %}

        <!-- Journal/date line -->
        {% if paper.date %}
        <p class="paper-meta">
            {% if paper.journal %}
            <span class="paper-journal">{{ paper.journal }}</span>, {{ paper.date | date: "%B %Y" }}
            {% else %}
            Working Paper, {{ paper.date | date: "%B %Y" }}
            {% endif %}
        </p>
        {% endif %}

        <!-- Minimal text links -->
        {% if paper.slides or paper.arxiv or paper.github or paper.html %}
        <div class="paper-links">
            {% if paper.slides %}
            <a href="{{ paper.slides }}" target="_blank" rel="noopener">
                {% if paper.slides_label %}{{ paper.slides_label }}{% else %}Slides{% endif %}
            </a>
            {% endif %}
        
            {% if paper.arxiv %}
            {% if paper.slides %}<span class="link-separator">&middot;</span>{% endif %}
            <a href="{{ paper.arxiv }}" target="_blank" rel="noopener">arXiv</a>
            {% endif %}
        
            {% if paper.github %}
            {% if paper.slides or paper.arxiv %}<span class="link-separator">&middot;</span>{% endif %}
            <a href="{{ paper.github }}" target="_blank" rel="noopener">GitHub</a>
            {% endif %}
        
            {% if paper.html %}
            {% if paper.slides or paper.arxiv or paper.github %}<span class="link-separator">&middot;</span>{% endif %}
            <a href="{{ paper.html }}" target="_blank" rel="noopener">HTML</a>
            {% endif %}
        </div>
        {% endif %}

        <!-- Inline summary -->
        {% if paper.summary %}
        <p class="paper-summary">{{ paper.summary }}</p>
        {% endif %}


    </article>

    {% unless forloop.last %}
    <hr class="paper-divider">
    {% endunless %}
    {% endfor %}

    <section>
        <p>This site was built using <a href="https://edwardtufte.github.io/tufte-css/" target="_blank">Tufte CSS</a>.
        </p>
    </section>
</section>

