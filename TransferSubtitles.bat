@echo off
SETLOCAL EnableDelayedExpansion

set from=OtherLife.2017.1080p.Netflix.WEB-DL.DD5.1.x264-QOQ[EtHD].mkv
set to=OtherLife.2017.1080p.Netflix.WEB-DL.DD5.1.x264-QOQ[EtHD].tiny.mp4
set output=output.mkv

FOR /F "tokens=*" %%g IN ('ffprobe %to% ^2^>^&1 ^| grep Stream ^| grep Video: -c') do (SET num_v_streams=%%g)
FOR /F "tokens=*" %%g IN ('ffprobe %to% ^2^>^&1 ^| grep Stream ^| grep Audio: -c') do (SET num_a_streams=%%g)
FOR /F "tokens=*" %%g IN ('ffprobe %from% ^2^>^&1 ^| grep Stream ^| grep Subtitle: -c') do (SET num_s_streams=%%g)

set /a num_v_streams=num_v_streams - 1
set /a num_a_streams=num_a_streams - 1
set /a num_s_streams=num_s_streams - 1

set command=ffmpeg -i %to% -i %from%

for /L %%a in (0,1,%num_v_streams%) do (
	set command=!command! -c copy -map 0:v:%%a
)

for /L %%a in (0,1,%num_a_streams%) do (
	set command=!command! -c copy -map 0:a:%%a
)

for /L %%a in (0,1,%num_s_streams%) do (
	set command=!command! -c copy -map 1:s:%%a
)

set command=!command! %output%

!command!

pause