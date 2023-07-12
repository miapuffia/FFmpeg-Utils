@echo off
SETLOCAL EnableDelayedExpansion

set input=OtherLife.2017.1080p.Netflix.WEB-DL.DD5.1.x264-QOQ[EtHD].mkv

FOR /F "tokens=*" %%g IN ('ffprobe %input% ^2^>^&1 ^| grep Stream ^| grep Subtitle: -c') do (SET numstreams=%%g)

set /a numstreams=numstreams - 1

set command=ffmpeg -i %input%

for /L %%a in (0,1,%numstreams%) do (
	set command=!command! -map 0:s:%%a -c copy extracted_subs_%%a.srt
)

!command!

pause