.PHONY: all html

all: html

html:
	podman run --rm -it -v $$(pwd):/data:Z docs-minimal asciidoctor --destination-dir /data/docs/output/ /data/docs/index.adoc

container_image:
	podman build --file docs/Containerfile --tag docs-minimal .

browser:
	xdg-open docs/output/index.html

clean:
	rm -fr docs/output/
