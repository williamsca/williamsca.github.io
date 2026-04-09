---
layout: page
title: "CV"
permalink: /cv/
description: "Curriculum vitae of Colin Williams"
---

{% assign papers = site.papers | sort: "date" | reverse %}
{% assign presentations = site.presentations | sort: "date" | reverse %}
{% assign today_iso = site.time | date: "%Y-%m-%d" %}

<div class="cv-page">
    <div class="cv-button-row">
        <a class="cv-download-button" href="{{ site.data.cv.pdf_url }}" target="_blank" rel="noopener">Download PDF</a>
    </div>

    <section class="cv-section">
        <h2>Education</h2>
        <ul class="cv-list">
            {% for entry in site.data.cv.education %}
            <li class="cv-row">
                <span class="cv-row-main">{{ entry.degree }}, {{ entry.institution }}</span>
                <span class="cv-row-meta">{{ entry.years }}</span>
            </li>
            {% endfor %}
        </ul>
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Fields of Interest</h2>
        <p class="cv-inline-list">{{ site.data.cv.fields_of_interest | join: ", " }}</p>
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Works in Progress</h2>
        {% assign has_works_in_progress = false %}
        {% for paper in papers %}
            {% unless paper.journal and paper.journal != "" %}
            {% assign has_works_in_progress = true %}
            <article class="cv-entry">
                <p class="cv-entry-title">{{ paper.title }}{% if paper.coauthors %}<span class="cv-entry-inline-meta"> <em>with {% if paper.coauthor_url %}<a href="{{ paper.coauthor_url }}" target="_blank" rel="noopener">{{ paper.coauthors }}</a>{% else %}{{ paper.coauthors }}{% endif %}</em></span>{% endif %}</p>
            </article>
            {% endunless %}
        {% endfor %}
        {% unless has_works_in_progress %}
        <p>None at the moment.</p>
        {% endunless %}
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Publications</h2>
        {% assign has_publications = false %}
        {% for paper in papers %}
        {% if paper.journal and paper.journal != "" %}
        {% assign has_publications = true %}
        <article class="cv-entry">
            <p class="cv-entry-title">{{ paper.title }}</p>
            <p class="cv-entry-meta"><span class="paper-journal">{{ paper.journal }}</span>{% if paper.date %}, {{ paper.date | date: "%Y" }}{% endif %}</p>
        </article>
        {% endif %}
        {% endfor %}
        {% unless has_publications %}
        <p></p>
        {% endunless %}
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Presentations, Schools, and Conferences</h2>
        <ul class="cv-list cv-year-list">
            {% assign has_presentations = false %}
            {% assign current_year = "" %}
            {% assign year_titles = "" %}
            {% for presentation in presentations %}
            {% assign has_presentations = true %}
            {% assign presentation_year = presentation.date | date: "%Y" %}
            {% assign presentation_title = presentation.title | default: presentation.name %}
            {% assign presentation_date_iso = presentation.date | date: "%Y-%m-%d" %}
            {% if presentation_year != current_year %}
                {% unless forloop.first %}
            <li class="cv-year-row">
                <span class="cv-year-label">{{ current_year }}</span>
                <span class="cv-year-items">{{ year_titles }}</span>
            </li>
                {% endunless %}
                {% assign current_year = presentation_year %}
                {% capture year_titles %}{{ presentation_title }}{% if presentation_date_iso > today_iso %}<sup>&dagger;</sup>{% endif %}{% endcapture %}
            {% else %}
                {% capture year_titles %}{{ year_titles }} | {{ presentation_title }}{% if presentation_date_iso > today_iso %}<sup>&dagger;</sup>{% endif %}{% endcapture %}
            {% endif %}
            {% if forloop.last %}
            <li class="cv-year-row">
                <span class="cv-year-label">{{ current_year }}</span>
                <span class="cv-year-items">{{ year_titles }}</span>
            </li>
            {% endif %}
            {% endfor %}
        </ul>
        {% unless has_presentations %}
        <p></p>
        {% endunless %}
        {% assign has_scheduled_presentations = false %}
        {% for presentation in presentations %}
        {% assign presentation_date_iso = presentation.date | date: "%Y-%m-%d" %}
        {% if presentation_date_iso > today_iso %}
        {% assign has_scheduled_presentations = true %}
        {% endif %}
        {% endfor %}
        {% if has_scheduled_presentations %}
        <p class="cv-legend"><sup>&dagger;</sup> Scheduled.</p>
        {% endif %}
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Awards, Grants, and Fellowships</h2>
        <ul class="cv-list">
            {% for award in site.data.cv.awards %}
            <li class="cv-row">
                <span class="cv-row-main">{{ award.title }}, {{ award.institution }}{% if award.amount %}, {{ award.amount }}{% endif %}</span>
                <span class="cv-row-meta">{{ award.year }}</span>
            </li>
            {% endfor %}
        </ul>
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>References</h2>
        {% if site.data.cv.references.size > 0 %}
        <ul class="cv-list">
            {% for reference in site.data.cv.references %}
            <li class="cv-reference">
                <span class="cv-entry-title">{{ reference.name }}</span>
                {% if reference.title %}<span>{{ reference.title }}</span>{% endif %}
                {% if reference.institution %}<span>{{ reference.institution }}</span>{% endif %}
                {% if reference.email %}<span><a href="mailto:{{ reference.email }}">{{ reference.email }}</a></span>{% endif %}
            </li>
            {% endfor %}
        </ul>
        {% else %}
        <p>{{ site.data.cv.references_note }}</p>
        {% endif %}
    </section>
</div>
