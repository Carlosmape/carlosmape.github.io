---
layout: default
title: Hard Skills
description: Met here all technical skills
---
# Technical skills
In this page you can see my hard-skills punctuated using this portfolio content based on elements defined among pages contained in projects sections

{% for d in site.data %}
## {{ d[0] | capitalize }}
{% assign val = d[1] | size %}
{% for skill in d[1] %}
{% assign punct = site.posts | where: d[0], skill | size %}
{% include skill-bar.html %}
{% endfor %}
{% endfor %}
