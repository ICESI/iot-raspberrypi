# Examples

Example pytube
```
from pytube import YouTube                
yt = YouTube('https://www.youtube.com/watch?v=sOS9aOIXPEk')
yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first().download()
```

# Issues

Problem
* https://stackoverflow.com/questions/62098925/why-my-youtube-video-downloader-only-downloads-some-videos-and-for-other-videos

Solution
```
find ~/ -iname extract.py
vi /home/pi/.virtualenvs/discord/lib/python3.7/site-packages/pytube/extract.py
:%s/parse_qs(formats[i]["cipher"])/parse_qs(formats[i]["signatureCipher"])
```

# References
https://realpython.com/how-to-make-a-discord-bot-python/
https://stackoverflow.com/questions/56060614/how-to-make-a-discord-bot-play-youtube-audio
https://github.com/ytdl-org/youtube-dl
https://python-pytube.readthedocs.io/en/latest/