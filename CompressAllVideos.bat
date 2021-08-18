:: -crf can be 19 for higher quality at double the size

for %%f in (*.mp4) do (
	ffmpeg -i "%%f" -c:v libx264 -crf 24 -level 3.1 -preset veryslow "%%~nf.tiny.mp4"
)

pause