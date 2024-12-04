PORT ?= 4000

.PHONY: serve
serve:
	docker run -p ${PORT}:${PORT} -v $(shell pwd):/site bretfisher/jekyll-serve
