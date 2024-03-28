.PHONY: all html

all: html

html:
	podman run --rm -it -v $$(pwd):/data:Z docs-minimal asciidoctor --destination-dir /data/github-pages/ /data/docs/index.adoc

container_image:
	podman build --file docs/Containerfile --tag docs-minimal .

browser:
	xdg-open github-pages/index.html

clean:
	rm -fr github-pages
