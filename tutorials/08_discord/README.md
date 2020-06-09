# Examples

Example pytube
```
from pytube import YouTube                
yt = YouTube('https://www.youtube.com/watch?v=sOS9aOIXPEk')
yt.streams.filter(progressive=True, file_extension='mp4').order_by('resolution').desc().first().download()
```

# Issues

Problem
```
File "/home/daniel/.virtualenvs/discord/lib/python3.8/site-packages/pytube/extract.py", line 301, in <listcomp>
    parse_qs(formats[i]["cipher"]) for i, data in enumerate(formats)
KeyError: 'cipher'
```

Solution
```
find ~/ -iname extract.py
vi /home/pi/.virtualenvs/discord/lib/python3.7/site-packages/pytube/extract.py
:%s/parse_qs(formats[i]["cipher"])/parse_qs(formats[i]["signatureCipher"])
```

Problem 
```
/home/daniel/.virtualenvs/discord/lib/python3.8/site-packages/discord/ext/commands/bot.py:132: RuntimeWarning: coroutine 'search.<locals>.check' was never awaited
  super().dispatch(event_name, *args, **kwargs)
RuntimeWarning: Enable tracemalloc to get the object allocation traceback
```

Solution
```
```

# References
* https://realpython.com/how-to-make-a-discord-bot-python/
* https://stackoverflow.com/questions/56060614/how-to-make-a-discord-bot-play-youtube-audio
* https://github.com/ytdl-org/youtube-dl
* https://python-pytube.readthedocs.io/en/latest/
* https://stackoverflow.com/questions/62098925/why-my-youtube-video-downloader-only-downloads-some-videos-and-for-other-videos
* https://gist.github.com/vbe0201/ade9b80f2d3b64643d854938d40a0a2d
