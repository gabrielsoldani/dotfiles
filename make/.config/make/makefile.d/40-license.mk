# TODO: Make this configurable. Currently it's ISC, and the name and the
# year is hardcoded. I should be able to pick from a couple of licenses,
# the year can be read from the system clock, and the name can default
# to the user's name in git or be overwritten.
LICENSE:
	echo "Copyright (c) 2022 Gabriel Soldani" > $@
	echo >> $@
	echo "Permission to use, copy, modify, and/or distribute this software for any" >> $@
	echo "purpose with or without fee is hereby granted, provided that the above" >> $@
	echo "copyright notice and this permission notice appear in all copies." >> $@
	echo >> $@
	echo "THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH" >> $@
	echo "REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY" >> $@
	echo "AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT," >> $@
	echo "INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM" >> $@
	echo "LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR" >> $@
	echo "OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR" >> $@
	echo "PERFORMANCE OF THIS SOFTWARE." >> $@

