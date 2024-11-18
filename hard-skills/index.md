---
layout: default
title: Hard Skills
description: Met here all technical skills
---
# Technical skills
In this page you can see my hard-skills punctuated using this portfolio content based on elements defined among pages contained in [projects](/projects) sections

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
