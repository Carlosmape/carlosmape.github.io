---
layout: default
title: Hard Skills
description: Met here all technical skills
---
# Soft skills
In this page you can see my soft-skills punctuated using this portfolio content based on elements defined among pages contained in [projects](/projects) sections

{% for tag in site.tags %}
{% assign skill = tag[0]%}
{% assign val = site.posts | size %}
{% assign punct = tag[1].size %}
{% assign punct = val | divided_by: punct | times: 10 %}
{% assign punct = 100 | minus: punct %}
{% include skill-bar.html %}
{% endfor %}
