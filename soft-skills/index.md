---
layout: default
title: Soft skills
description: No description provided
hidden_cats:
    - soft-skills
    - team-work
    - proactivity
    - continuous learning
---

In this section I cover my remarkable soft-skills with some use cases

# Team Work

<div class="posts">
    {% for post in site.categories['team-work'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

# Proactivity
<div class="posts">
    {% for post in site.categories['proactivity'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

# Continuous Learning
<div class="posts">
    {% for post in site.categories['continuous learning'] %}
        {% include post-card.html %}
    {% endfor %}
</div>
