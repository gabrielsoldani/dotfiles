PANDOCRECIPE=pandoc-recipe

.SUFFIXES: .md .pdf .html

.md.html:
	$(PANDOCRECIPE) $< -o $@

.md.pdf:
	$(PANDOCRECIPE) $< -o $@
