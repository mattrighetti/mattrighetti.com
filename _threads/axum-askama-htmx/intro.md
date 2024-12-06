---
title: "Axum, Askama, HTMX"
layout: thread
date: 2024-12-05
op: true
permalink: "/threads/axum-askama-htmx"
---

Lately I've been working on [Ulry][0], after tiressly trying to make Next.js
work for me, I realised it wasn't the right fit ([I'm not alone][2]).  I decided
to make a U-turn and go all in with Rust and SSR.

I already have my APIs running on `axum`, I know and like HTMX a bit as I've
used it in some other minor project using Go [[1]]. Time to try something in
new with Rust.

I only need something to render the pages for the webiste, axum bare
`Html<&str>` is not going to cut it.

I stumbled upon [Tera][3] and [Askama][4]. The two are very similar templating
frameworks - the only difference is that Askama compiles templates at compile
time, Tera does not. This, in theory, makes Askama a lot faster. But I did not
chose if for that reason alone, I'd argue that the selling point for me was that
with Askama you don't have to have templates to be parsed at runtime, you just
have your binary file and everything is packaged in there.

Off to a good start.

[0]: https://ulry.app
[1]: https://mettag.ulry.app
[2]: https://blog.erodriguez.de/dependency-management-fatigue-or-why-i-forever-ditched-react-for-go-htmx-templ/
[3]: https://github.com/Keats/tera
[4]: https://github.com/djc/askama