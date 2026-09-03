---
layout: page
title: "CV"
permalink: /cv/
description: "Curriculum vitae of Colin Williams"
pdf_button: true
---

{% assign papers = site.papers | sort: "date" | reverse %}
{% assign presentations = site.presentations | sort: "date" | reverse %}
{% assign today_iso = site.time | date: "%Y-%m-%d" %}

<div class="cv-page">
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
        {% assign has_publications = false %}
        {% for paper in papers %}
        {% if paper.status == "Publication" %}
        {% assign has_publications = true %}
        {% endif %}
        {% endfor %}
        {% if has_publications %}
        <h2>Publications</h2>
        {% for paper in papers %}
        {% if paper.status == "Publication" %}
        <article class="cv-entry">
            <p class="cv-entry-title">{% if paper.link %}<a href="{{ paper.link }}" target="_blank" rel="noopener">{{ paper.title }}</a>{% else %}{{ paper.title }}{% endif %}{% if paper.journal %}<span class="cv-entry-inline-meta">, {{ paper.journal }}{% if paper.date %}, {{ paper.date | date: "%Y" }}{% endif %}</span>{% endif %}</p>
        </article>
        {% endif %}
        {% endfor %}
        {% endif %}

        <h2>Working Papers</h2>
        {% assign has_working_papers = false %}
        {% for paper in papers %}
            {% if paper.status == "Working Paper" %}
            {% assign has_working_papers = true %}
            <article class="cv-entry">
                <p class="cv-entry-title">{% if paper.link %}<a href="{{ paper.link }}" target="_blank" rel="noopener">{{ paper.title }}</a>{% else %}{{ paper.title }}{% endif %}{% if paper.coauthors %}<span class="cv-entry-inline-meta"> <em>with {% if paper.coauthor_url %}<a href="{{ paper.coauthor_url }}" target="_blank" rel="noopener">{{ paper.coauthors }}</a>{% else %}{{ paper.coauthors }}{% endif %}</em></span>{% endif %}</p>
            </article>
            {% endif %}
        {% endfor %}
        {% unless has_working_papers %}
        <p>None at the moment.</p>
        {% endunless %}

        {% assign has_other_publications = false %}
        {% for paper in papers %}
        {% if paper.status == "Other Publication" %}
        {% assign has_other_publications = true %}
        {% endif %}
        {% endfor %}
        {% if has_other_publications %}
        <h2>Other Publications</h2>
        {% for paper in papers %}
        {% if paper.status == "Other Publication" %}
        <article class="cv-entry">
            <p class="cv-entry-title">{% if paper.link %}<a href="{{ paper.link }}" target="_blank" rel="noopener">{{ paper.title }}</a>{% else %}{{ paper.title }}{% endif %}{% if paper.journal %}<span class="cv-entry-inline-meta">, {{ paper.journal }}{% if paper.date %}, {{ paper.date | date: "%Y" }}{% endif %}</span>{% endif %}</p>
        </article>
        {% endif %}
        {% endfor %}
        {% endif %}
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
        <h2>Research and Professional Experience</h2>
        <ul class="cv-list">
            {% for entry in site.data.cv.research_experience %}
            <li class="cv-row">
                <span class="cv-row-main"><em>{{ entry.role }}</em>, {{ entry.detail }}</span>
                {% if entry.years %}<span class="cv-row-meta">{{ entry.years }}</span>{% endif %}
            </li>
            {% endfor %}
        </ul>
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Professional Service</h2>
        <ul class="cv-list">
            {% for entry in site.data.cv.professional_service %}
            <li class="cv-row">
                <span class="cv-row-main"><em>{{ entry.role }}</em>, {{ entry.detail }}</span>
                {% if entry.years %}<span class="cv-row-meta">{{ entry.years }}</span>{% endif %}
            </li>
            {% endfor %}
        </ul>
    </section>
    <hr class="entry-divider cv-divider">

    <section class="cv-section">
        <h2>Committee</h2>
        {% if site.data.cv.committee.size > 0 %}
        <div class="cv-committee-grid">
            {% for member in site.data.cv.committee %}
            <div class="cv-reference">
                <span class="cv-entry-title">{{ member.name }}</span>
                {% if member.title %}<span>{{ member.title }}</span>{% endif %}
                {% if member.institution %}<span>{{ member.institution }}</span>{% endif %}
                {% if member.email %}<span><a href="mailto:{{ member.email }}">{{ member.email }}</a></span>{% endif %}
                {% if member.phone %}<span>{{ member.phone }}</span>{% endif %}
            </div>
            {% endfor %}
        </div>
        {% else %}
        <p>{{ site.data.cv.committee_note }}</p>
        {% endif %}
    </section>
</div>
