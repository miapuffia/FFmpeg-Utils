ffmpeg -i input.mp4 -itsoffset delaySeconds -i input.mp4 -map 0:v -map 1:a -c copy output.mp4