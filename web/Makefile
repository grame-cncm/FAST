MAKE 	?= make

help:
	@echo "Available targets are:"
	@echo "  install  : install the required components"
	@echo "  build    : build the web site"
	@echo "  serve    : launch the mkdoc server"
	
build:
	mkdocs build
	git checkout ../docs/CNAME
	
serve:
	mkdocs serve

all:
	$(MAKE) build
	
####################################################################
install:
	pip install mkdocs
#	pip install mkdocs-pdf-export-plugin
	pip install markdown-include
	pip install mkdocs-bootswatch
	pip install python-markdown-math
#	npm i railroad-diagrams

uninstall:
	pip uninstall -y mkdocs-material
	pip uninstall -y pymdown-extensions
	pip uninstall -y markdown-blockdiag
#	pip uninstall -y mkdocs-pdf-export-plugin	
