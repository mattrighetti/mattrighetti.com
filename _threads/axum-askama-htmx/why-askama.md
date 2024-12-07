---
title: "Why Askama?"
layout: thread
date: 2024-12-06
permalink: "/threads/axum-askama-htmx"
---

Askama implements a template rendering engine based on Jinja. It generates Rust
code from your templates at compile time based on a user-defined struct to hold
the template's context.

This was very appealing from the very first moment. You can keep all your
templates in your root folder, for example `templates/home.jinja`.

{% raw %}
```jinja
{% block content %}
    <h1>Hello, {{email}}</h1>
    {% if let Some(name) = name %}
        <h1>Hello, {{name}}</h1>
    {% else %}
    {% endif %} 
{% endblock %}
```
{% endraw %}

And then you can use your template with a struct in your project

```rust
use askama::Template;

#[derive(Template)]
#[template(path="home.jinja")]
pub struct HomeTemplate {
    // some users might not have one upon sign-up
    name: Option<String>,
    // email is required
    email: String,
}
```

What's really cool is that you can even use rust syntax inside of templates


{% raw %}
```jinja
{% block content %}
    {% if let Some(name) = name %}
        <h1>Hello, {{name}}</h1>
    {% else %}
        <h1>Hello, {{email}}</h1>
    {% endif %}
{% endblock %}
```
{% endraw %}