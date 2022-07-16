.SUFFIXES: .mkv .mp4 .srt

.mkv.srt .mp4.srt:
	ffmpeg -i $< -map 0:s:a $@
