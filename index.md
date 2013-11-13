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

This is mostly for testing purposes, though I certainly wouldn't <i>object</i> to any donations!

<a class='coinbase-button' data-code='56c4a06eb3b916fd79bd1c758ae16b39' data-button-style='donation_small' href='https://coinbase.com/checkouts/56c4a06eb3b916fd79bd1c758ae16b39'>Donate Bitcoins</a>
<script src='https://coinbase.com/assets/button.js' type='text/javascript'> </script>