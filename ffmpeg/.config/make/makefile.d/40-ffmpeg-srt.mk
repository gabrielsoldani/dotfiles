.SUFFIXES: .mkv .mp4 .srt

.mkv.srt .mp4.srt:
	# Priority: English > English SDH > Portuguese
	$(FFMPEG) -i $< -map 0:s:m:language:eng -map -0:s:m:title:SDH $@ \
		|| $(FFMPEG) -i $< -map 0:s:m:language:eng -map 0:s:m:title:SDH $@ \
		|| $(FFMPEG) -i $< -map 0:s:m:language:por -map -0:s:m:title:SDH $@
