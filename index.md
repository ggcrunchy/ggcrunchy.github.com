---
layout: default
---

### Amazing stuff

A fumbling (and late-started) attempt at a game for Github's Game Off 2012:

[Take The Fork](projects/TakeTheFork/take_the_fork/index.html)

This is a proof of concept more than anything. I've since incorporated the [Binary Land](http://www.youtube.com/watch?v=mMwiko71qVw)
mechanic into a different project, still in progress. Meanwhile, a friend did something cool with it too:

[Abbigale and the Monster](http://gamejolt.com/games/puzzle/abbigale-and-the-monster/13374)

The **Take The Fork** link may or may not work&mdash;I think it times out? It compiles **A LOT** of Lua to JavaScript, with no caching
to speak of, which I imagine (pending further investigation) to be the reason. If so, do a refresh... or two. Or three.

It emulates pieces of the [Corona SDK](http://www.coronalabs.com), namely (some of) the display library, most of the
transition and timer libraries, event listeners, plus some odds and ends. This allowed me to bring in several modules I'd developed:
at the moment all these can be found in [snippets](https://github.com/ggcrunchy/corona-sdk-snippets); the intent is to submodulize the
majority into [Tektite](https://github.com/ggcrunchy/Tektite) (mostly done) and [CrownJewels](https://github.com/ggcrunchy/CrownJewels) (pending).

[Love2D WebPlayer](https://github.com/ghoulsblade/love-webplayer) was used under the hood, and [lua.js](https://github.com/mherkender/lua.js)
in turn backs (backed?) that. Both are cool projects. Unfortunately my toolkit seems to be wide-ranging enough to flush out all the NYI Lua
corner cases. :D This quickly saw me acquainted with [Dragonfly](http://www.opera.com/dragonfly/).

I spent too much time distracted from the game itself, and it looks like even the core logic only half works. I may re-explore
the idea, though probably with an [Emscripten](https://github.com/kripken/emscripten)-based VM (more than anything for approximate
feature-completeness).

Repository [here](https://github.com/ggcrunchy/game-off-2012).
