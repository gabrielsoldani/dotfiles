.SUFFIXES: .mkv .mp4 .srt

.mkv.srt .mp4.srt:
	$(FFMPEG) -i $< -map 0:s:a $@
