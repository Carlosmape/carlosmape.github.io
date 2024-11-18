---
layout: default
title: Hard Skills
description: Met here all technical skills
---
# Technical skills
This page showcases my hard skills, punctuated based on the projects I’ve worked on. The content displayed reflects my expertise in various technologies, operating systems, databases, languages, and IDEs. The progress bars are computed using the data collected from the **[projects](/projects)** section, giving a visual representation of my proficiency in each skill category.

{% for d in site.data %}
{% assign group = d[0]%}
{% assign skills = d[1]%}
{% assign val = site.posts | where_exp: "post", "post[group] != nil" | size %}

## {{ group | capitalize }}
{% for skill in skills %}
{% assign punct = site.posts | where: group, skill | size %}
{% assign punct = val | divided_by: punct | times: 10 %}
{% assign punct = 100 | minus: punct %}
{% include skill-bar.html %}
{% endfor %}
{% endfor %}
