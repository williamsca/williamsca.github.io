---
layout: page
title: "CV"
permalink: /cv/
description: "Curriculum vitae of Colin Williams"
---

{% assign publications = site.papers | where_exp: "paper", "paper.journal != nil and paper.journal != ''" | sort: "date" | reverse %}
{% assign works_in_progress = site.papers | where_exp: "paper", "paper.journal == nil or paper.journal == ''" | sort: "date" | reverse %}
{% assign presentations = site.presentations | sort: "date" | reverse %}
{% assign presentation_years = presentations | group_by_exp: "presentation", "presentation.date | date: '%Y'" %}
{% assign scheduled_presentations = site.presentations | where_exp: "presentation", "presentation.date > site.time" %}

<div class="cv-page">
    <div class="cv-button-row">
        <a class="cv-download-button" href="{{ site.data.cv.pdf_url }}" target="_blank" rel="noopener">Download PDF CV</a>
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
        {% if works_in_progress.size > 0 %}
            {% for paper in works_in_progress %}
            <article class="cv-entry">
                <p class="cv-entry-title">{{ paper.title }}</p>
                {% if paper.coauthors %}
                <p class="cv-entry-meta">with {% if paper.coauthor_url %}<a href="{{ paper.coauthor_url }}" target="_blank" rel="noopener">{{ paper.coauthors }}</a>{% else %}{{ paper.coauthors }}{% endif %}</p>
                {% endif %}
            </article>
            {% endfor %}
        {% endif %}
    </section>
    <hr class="entry-divider cv-divider">

    {% if publications.size > 0 %}
    <section class="cv-section">
        <h2>Publications</h2>
        {% for paper in publications %}
        <article class="cv-entry">
            <p class="cv-entry-title">{{ paper.title }}</p>
            <p class="cv-entry-meta"><span class="paper-journal">{{ paper.journal }}</span>{% if paper.date %}, {{ paper.date | date: "%Y" }}{% endif %}</p>
        </article>
        {% endfor %}
    </section>
    <hr class="entry-divider cv-divider">
    {% endif %}

    {% if presentations.size > 0 %}
    <section class="cv-section">
        <h2>Presentations, Schools, and Conferences</h2>
        <ul class="cv-list cv-year-list">
            {% for year in presentation_years %}
            <li class="cv-year-row">
                <span class="cv-year-label">{{ year.name }}</span>
                <span class="cv-year-items">
                    {% assign year_items = year.items | sort: "date" %}
                    {% for presentation in year_items %}
                        {{ presentation["title"] | default: presentation["name"] }}{% if presentation["date"] > site.time %}<sup>&dagger;</sup>{% endif %}{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                </span>
            </li>
            {% endfor %}
        </ul>
        {% if scheduled_presentations.size > 0 %}
        <p class="cv-legend"><sup>&dagger;</sup> Scheduled.</p>
        {% endif %}
    </section>
    <hr class="entry-divider cv-divider">
    {% endif %}

    {% if site.data.cv.awards.size > 0 %}
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
    {% endif %}

    {% if site.data.cv.references.size > 0 or site.data.cv.references_note %}
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
    {% endif %}
</div>
