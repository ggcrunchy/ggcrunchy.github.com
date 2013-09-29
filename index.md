---
layout: default
title: Crunch
---

Very much a work in progress, mostly just learning the ins and outs of Jekyll, Bootstrap, et al. More or less all structure
is copied wholesale out of tutorials or sample code, until enough ideas have sunk in where I feel confident experimenting.

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
