---
layout: default
title: Test Page
description: No description provided
---
{% assign tehcList = ''|split:'' %}
{% assign langList = ''|split:'' %}
{% assign idesList = ''|split:'' %}
{% for p in site.posts %}
    {% if p.technologies.size %}
        {% assign techList = techList | concat: p.technologies | uniq | sort %}
    {% endif %}
    {% if p.languages.size %}
        {% assign langList = langList | concat: p.languages | uniq | sort %}
    {% endif %}
    {% if p.ides.size %}
        {% assign idesList = idesList | concat: p.ides | uniq | sort %}
    {% endif %}
{% endfor %}

{% assign maxTechCount = 0 %}
{% for t in techList %}
    {% assign tCount = site.posts | where: 'technologies', t | size %}
    {% if tCount > maxTechCount %}{% assign maxTechCount = tCount %}{% endif %}
{% endfor %}

{% assign maxLangCount = 0 %}
{% for l in langList %}
    {% assign lCount = site.posts | where: 'languages', l | size %}
    {% if lCount > maxLangCount %}{% assign maxLangCount = lCount %}{% endif %}
{% endfor %}

{% assign maxIdesCount = 0 %}
{% for i in idesList %}
    {% assign iCount = site.posts | where: 'ides', i | size %}
    {% if iCount > maxIdesCount %}{% assign maxIdesCount = iCount %}{% endif %}
{% endfor %}

# Technologies
{% for skill in techList %}
{% assign val =  site.posts | where: 'technologies', skill | size %}
{% assign punct = val | times:10 | divided_by: maxTechCount %}
{% include skill-bar.html %}
{% endfor %}
# Programming
## Languages
{% for skill in langList %}
{% assign val =  site.posts | where: 'languages', skill | size %}
{% assign punct = val | times:10 | divided_by: maxLangCount %}
{% include skill-bar.html %}
{% endfor %}
## IDEs
{% for skill in idesList %}
{% assign val =  site.posts | where: 'ides', skill | size %}
{% assign punct = val | times:10 | divided_by: maxIdesCount %}
{% include skill-bar.html %}
{% endfor %}
## Paradigms

# Engineering
## Methodologies
## Documentation
## Software life-cycle
