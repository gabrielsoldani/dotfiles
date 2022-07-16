.SUFFIXES: .mkv .mp4 .mov

.mov.mkv .mp4.mkv .mkv.mp4:
	ffmpeg -i $< -c copy $@
