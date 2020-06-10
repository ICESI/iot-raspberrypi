# bot.py
import os
import random
import os
import asyncio
import uuid
import pytube
from discord import FFmpegPCMAudio
from discord import Activity, ActivityType
from discord.ext.commands import Bot
from dotenv import load_dotenv
from pytube import YouTube
from youtube_search import YoutubeSearch
import pdb

load_dotenv()
extension = 'mp4'
TOKEN = os.getenv('DISCORD_TOKEN')
bot = Bot(command_prefix='*')

@bot.command(
    name='play',
    help='play song',
    description='Plays a mp4 in the voice channel',
    pass_context=True,
)
async def play(context, arg):
    # Grab the user who sent the command
    user=context.message.author
    channel_voice_name = user.voice.channel.name
    channel_voice = user.voice.channel
    youtube_url = arg

    # Send message to text channel
    await context.send(':fireworks: DaLaPoLis joined to {0} channel'.format(channel_voice_name))

    # Only play music if user is in a voice channel
    if channel_voice_name!= None:
        # Play youtube url
        voice_client = await channel_voice.connect()
        await play_youtube_url(youtube_url, context, voice_client)
        await voice_client.disconnect()
        voice_client.stop()
    else:
        await context.send('User is not in a voice channel')

@bot.command(
    name='stop',
    help='stop song',
    description='Stops a mp3 being played in the voice channel',
    pass_context=True,
)
async def stop(context):
    # Grab the user who sent the command
    guild = context.guild
    user=context.message.author
    channel_name = user.voice.channel.name

    # Only play music if user is in a voice channel
    if channel_name!= None:
        # Get voice_client
        voice_client = guild.voice_client

        # Disconnect after the player has finished
        voice_client.stop()
        await voice_client.disconnect()
    else:
        await context.send('User is not in a voice channel')

@bot.command(
    name='search',
    help='search song',
    description='Search for a song in YouTube',
    pass_context=True,
)
async def search(context, *args):
    # Grab the user who sent the command
    user=context.message.author
    channel_voice_name = user.voice.channel.name
    channel_voice = user.voice.channel
    guild = context.guild
    song_name = ' '.join(args)

    # Search song in YouTube
    song_list = ''
    results = YoutubeSearch(song_name, max_results=10).to_dict()

    for i, result in enumerate(results):
        song_list = song_list + str(i+1) + '-' + result['title'] + '\n'

    if song_list == '':
        await context.send('Not found')
        return None

    await context.send(':dancer: Choose your a song from the list'+ '\n' + song_list)

    if channel_voice_name!= None:

        # Validate selection has been received
        def check(message):
            if message.author != bot.user and message.author == user:
                return True

        try:
            msg = await bot.wait_for('message', timeout=30.0, check=check)
            selection = int(msg.content) - 1
            youtube_url = 'www.youtube.com' + results[selection]['link']
            await play_youtube_url(youtube_url, context, channel_voice)

        except asyncio.TimeoutError:
            await context.send(':timer: Selection time expired')
        else:
            await context.send('Good Bye!')
    else:
        await context.send('User is not in a voice channel')

async def play_youtube_url(youtube_url, context, channel_voice):
    # Download song
    await context.send(':robot: Fetching song ...')
    file_id = uuid.uuid1().hex
    yt = YouTube(youtube_url)
    song_title = yt.title
    filename = '{0}.{1}'.format(file_id, extension)
    yt.streams.get_audio_only().download(filename=file_id)
    guild = context.guild

    # Send message to text channel
    await context.send(':musical_keyboard: Playing {0} :musical_keyboard:'.format(song_title))

    # Setting bot status
    # await bot.change_presence(activity=Activity(type=ActivityType.playing, name=song_title))

    # Connect to voice client
    voice_client = guild.voice_client
    if not voice_client:
        voice_client = await channel_voice.connect()

    # Play music
    voice_client.play(FFmpegPCMAudio(filename), after=lambda error: print('done'))

    # Check if audio is playing
    while voice_client.is_playing():
        await asyncio.sleep(1)

    # Disconnect from voice client
    await voice_client.disconnect()
    voice_client.stop()

    # Disconnect after the player has finished
    os.remove(filename)

    # Setting bot status
    # await bot.change_presence(activity=None)

bot.run(TOKEN)

