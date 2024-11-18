---
layout: default
title: Hard Skills
description: Met here all technical skills
---
# Soft skills
In this page, you can find the soft skills that most effectively reflect my character and professional approach. These qualities are essential for any successful workplace. On the [projects page](/projects), you can explore detailed use cases that demonstrate how I apply these skills to real-world challenges, showcasing my ability to deliver results and thrive in diverse environments.

<div class="skills">
{% for tag in site.tags %}
{% assign s = tag[0]%}
{% include skill-bubble.html %}
{% endfor %}
</div>
