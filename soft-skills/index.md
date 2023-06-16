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

<ul class="posts">
    {% for post in site.categories['team-work'] %}
    <a href="{{ post.url }}" class="btn" title="{{ post.description }}">
    	<div class="post-date">{{ post.date | date: "%b %Y" }}</div>
    	<div class="post-title">{{ post.title }}</div>
    	<div class="post-cats">

    		{% for cat in post.categories %}
                {% if page.hidden_cats contains cat %}
                {% else %}
    		    	<div class="post-cat-{{ cat }}">{{ cat }}</div>
                {% endif %}
    		{% endfor %}
    	</div>
    	<div class="post-tags">
    		{% for tag in post.tags %}
    		    	<div class="post-tag-{{ tag }}">{{ tag }}</div>
    		{% endfor %}
    	</div>
    </a>
    {% endfor %}
</ul>

# Proactivity
<ul class="posts">
    {% for post in site.categories['proactivity'] %}
     <a href="{{ post.url }}" class="btn" title="{{ post.description }}">
    	<div class="post-date">{{ post.date | date: "%b %Y" }}</div>
    	<div class="post-title">{{ post.title }}</div>
    	<div class="post-cats">

    		{% for cat in post.categories %}
                {% if page.hidden_cats contains cat %}
                {% else %}
    		    	<div class="post-cat-{{ cat }}">{{ cat }}</div>
                {% endif %}
    		{% endfor %}
    	</div>
    	<div class="post-tags">
    		{% for tag in post.tags %}
    		    	<div class="post-tag-{{ tag }}">{{ tag }}</div>
    		{% endfor %}
    	</div>
    </a>
    {% endfor %}
</ul>

# Continuous Learning
<ul class="posts">
    {% for post in site.categories['continuous learning'] %}
     <a href="{{ post.url }}" class="btn" title="{{ post.description }}">
    	<div class="post-date">{{ post.date | date: "%b %Y" }}</div>
    	<div class="post-title">{{ post.title }}</div>
    	<div class="post-cats">

    		{% for cat in post.categories %}
                {% if page.hidden_cats contains cat %}
                {% else %}
    		    	<div class="post-cat-{{ cat }}">{{ cat }}</div>
                {% endif %}
    		{% endfor %}
    	</div>
    	<div class="post-tags">
    		{% for tag in post.tags %}
    		    	<div class="post-tag-{{ tag }}">{{ tag }}</div>
    		{% endfor %}
    	</div>
    </a>
    {% endfor %}
</ul>
