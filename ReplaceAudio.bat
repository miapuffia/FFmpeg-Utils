ffmpeg -i v.mp4 -i a.m4a -c copy -map 0:v:0 -map 1:a:0 output.mp4