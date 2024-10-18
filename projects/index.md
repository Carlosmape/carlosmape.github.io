---
layout: default
title: Projects
description: Some of projects I participated I consider remarkables
---

# Remarkable Professional Projects
These are, in my opinion, mostly remarkable projects I took part of:
<div class="posts">
    {% for post in site.categories['Professional project'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

# Personal/Academic Projects
There are some of my personal/academic projects:
<div class="posts">
    {% for post in site.categories['Personal project'] %}
        {% include post-card.html %}
    {% endfor %}
    {% for post in site.categories['Academic project'] %}
        {% include post-card.html %}
    {% endfor %}
</div>

You can find all my personal projects[⁽¹⁾](#info) in [my github](https://github.com/Carlosmape)

### Info
*⁽¹⁾ Some project could be in a private repository, if so, I explained in further detail on my website instead of link to the repo*
