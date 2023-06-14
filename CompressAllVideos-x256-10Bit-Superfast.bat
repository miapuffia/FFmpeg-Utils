:: -crf can be 19 for higher quality at double the size

for %%f in (*.mp4) do (
	ffmpeg -i "%%f" -pix_fmt yuv420p10le -c:v libx265 -crf 29 -level 3.1 -preset superfast -max_muxing_queue_size 9999 -x265-params profile=main10:pmode=1:ctu=32:merange=26 "%%~nf.tiny.mp4"
	powershell -command "(Get-Item '%%~nf.tiny.mp4').LastWriteTime=((Get-Item '%%f').LastWriteTime)"
)

pause
