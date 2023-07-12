@echo off
SETLOCAL EnableDelayedExpansion

set video=Everything.Everywhere.All.At.Once.2022.1080p.WEBRip.x264.AAC5.1-[YTS.MX].tiny.mp4
set subtitle=Everything.Everywhere.All.At.Once.2022.1080p.WEBRip.x264.AAC5.1-[YTS.MX].srt
set output=output.mkv

FOR /F "tokens=*" %%g IN ('ffprobe %video% ^2^>^&1 ^| grep Stream ^| grep Video: -c') do (SET num_v_streams=%%g)
FOR /F "tokens=*" %%g IN ('ffprobe %video% ^2^>^&1 ^| grep Stream ^| grep Audio: -c') do (SET num_a_streams=%%g)

set /a num_v_streams=num_v_streams - 1
set /a num_a_streams=num_a_streams - 1

set command=ffmpeg -i %video% -i %subtitle%

for /L %%a in (0,1,%num_v_streams%) do (
	set command=!command! -c copy -map 0:v:%%a
)

for /L %%a in (0,1,%num_a_streams%) do (
	set command=!command! -c copy -map 0:a:%%a
)

set command=!command! -c copy -map 1:s:0 %output%

!command!

pause