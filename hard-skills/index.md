---
layout: default
title: Hard Skills
description: Met here all technical skills
---
<!-- <pre> -->
<!-- {{ site | inspect }} -->
<!-- </pre> -->

{% for d in site.data %}
# {{ d[0] | capitalize }}
{% assign val = d[1] | size %}
{% for skill in d[1] %}
{% assign punct = site.posts | where: d[0], skill | size %}
{% include skill-bar.html %}
{% endfor %}
{% endfor %}
