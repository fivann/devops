# merge video and audio streams
ffmpeg -i 1-v.mp4 -i 1-a.mp4 -c:v copy -c:a copy 1-all.mp4
