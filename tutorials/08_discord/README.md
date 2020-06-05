# Examples

```
from pytube import YouTube                
yt = YouTube('https://www.youtube.com/watch?v=sOS9aOIXPEk')
yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first().download()
```

# References
https://realpython.com/how-to-make-a-discord-bot-python/
https://stackoverflow.com/questions/56060614/how-to-make-a-discord-bot-play-youtube-audio
https://github.com/ytdl-org/youtube-dl
https://python-pytube.readthedocs.io/en/latest/