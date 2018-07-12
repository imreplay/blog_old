---
title: "Post about Wargame"
layout: archive
permalink: /categories/wargame
author_profile: true
sidebar_main: true
---

{% assign posts = site.categories.Wargame | sort:"tags" | reverse %}

{% for post in posts %}
  {% include archive-single.html type=page.entries_layout %}
{% endfor %}