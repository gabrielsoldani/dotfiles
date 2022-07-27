.editorconfig:
	echo "# https://editorconfig.org" > $@
	echo "root = true" >> $@
	echo >> $@
	echo "[*]" >> $@
	echo "charset = utf-8" >> $@
	echo "end_of_line = lf" >> $@
	echo "indent_size = 4" >> $@
	echo "indent_style = space" >> $@
	echo "# Final newline is mandatory." >> $@
	echo "# https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_206" >> $@
	echo "insert_final_newline = true" >> $@
	echo "trim_trailing_whitespace = true" >> $@
	echo >> $@
	echo "[*.md]" >> $@
	echo "# Trailing whitespace is meaningful." >> $@
	echo "# https://spec.commonmark.org/0.30/#hard-line-breaks" >> $@
	echo "trim_trailing_whitespace = false" >> $@
