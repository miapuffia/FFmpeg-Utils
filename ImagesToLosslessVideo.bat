:: Lossless mkv
:: ffmpeg -framerate 60 -i %%04d.png -codec copy lossless.mkv

:: Lossless mp4 (much smaller than source images)
:: ffmpeg -f image2 -r 60 -i %%04d.png -vcodec libx264 -profile:v high444 -refs 16 -crf 0 -preset ultrafast lossless.mp4

:: Lossless avi (slightly larger than source images)
:: ffmpeg -r 60 -start_number 1 -f image2 -i %%04d.png -vcodec png lossless.avi

pause