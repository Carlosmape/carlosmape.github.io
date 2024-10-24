---
layout: default
title: Soft skills
description: No description provided
---

In this section I cover my remarkable soft-skills with some use cases

# Team Work

<div class="posts">
    {% for usecase in site.tags['Team work'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

# Proactivity
<div class="posts">
    {% for usecase in site.tags['Proactivity'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

# Continuous Learning
<div class="posts">
    {% for usecase in site.tags['Continuous learning'] %}
        {% include post-card.html %}
    {% endfor %}
</div>
