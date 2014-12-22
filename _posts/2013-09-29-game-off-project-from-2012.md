---
layout: default
title: Take The Fork
---

![Amazing stuff!]({{ site.url }}/projects/TakeTheFork/screenshot.jpg)

A fumbling (and late-started) attempt at a game for [Github's Game Off 2012](https://github.com/ggcrunchy/game-off-2012):

[Take The Fork]({{ site.url }}/projects/TakeTheFork/take_the_fork/index.html)

(The cursor keys control the Spacemen: all three of them... but two of them move in reverse! The goal is to collect the fork.)

The link may or may not work&mdash;I think it times out? **A LOT** of Lua gets compiled to JavaScript, with no caching
to speak of, which I imagine (pending further investigation) to be the reason. If so, do a refresh... or two. Or three.

It emulates the interface and behavior of various components of the [Corona SDK](http://www.coronalabs.com), namely (some of) the
display library, most of the transition and timer libraries, event listeners, plus some odds and ends. This allowed me to bring in
several modules I'd developed; at the moment these can all be found in [snippets](https://github.com/ggcrunchy/corona-sdk-snippets)&lowast;
&mdash;in particular, this is largely a port of the "Game" snippet.

[Love2D WebPlayer](https://github.com/ghoulsblade/love-webplayer) was used under the hood, and [lua.js](https://github.com/mherkender/lua.js)
in turn backs (backed?) that. Both are cool projects. Unfortunately my toolkit seems to be wide-ranging enough to flush out all the NYI Lua
corner cases. I spent too much time distracted from the game itself, and it looks like even the core logic only half works&mdash;in particular,
the fork collision is sporadically broken. I may re-explore the idea, though probably with an [Emscripten](https://github.com/kripken/emscripten)-based
VM (having neither coroutines nor weak tables was a tough row to hoe).

This is a proof of concept more than anything. I've since incorporated the [Binary Land](http://www.youtube.com/watch?v=mMwiko71qVw)
mechanic into a different project, still in progress. Meanwhile, a friend did something rather nice with the same mechanic:

[Abbigale and the Monster](http://gamejolt.com/games/puzzle/abbigale-and-the-monster/13374)

&lowast; - My intent, however, is for future code to use submodules, which will see much of this migrated out. **UPDATE** This is mostly done.