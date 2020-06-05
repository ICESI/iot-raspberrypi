# bot.py
import os
import random
import os
import asyncio
import uuid
from discord import FFmpegPCMAudio
from discord.ext.commands import Bot
from dotenv import load_dotenv
from pytube import YouTube

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
    # grab the user who sent the command
    user=context.message.author
    channel_name = user.voice.channel.name
    channel_voice = user.voice.channel
    youtube_url = arg

    # message                                                                   
    await context.send(':fireworks: DaLaPoLis joined to {0} channel'.format(channel_name))

    # only play music if user is in a voice channel
    if channel_name!= None:
        # create StreamPlayer
        voice_client = await channel_voice.connect()

        # Download song
        await context.send(':robot: Fetching song ...')
        file_id = uuid.uuid1().hex
        yt = YouTube(youtube_url)
        yt.streams.get_audio_only().download(filename=file_id)
        song_title = yt.title
        filename = '{0}.{1}'.format(file_id, extension)
            
        # message                                                                   
        await context.send(':musical_keyboard: Playing: {0} :musical_keyboard:'.format(song_title))

        # Play music
        player = voice_client.play(FFmpegPCMAudio(filename), after=lambda: print('done'))

        # Check if audio is playing
        while voice_client.is_playing():
            await asyncio.sleep(1)
        
        # disconnect after the player has finished
        os.remove(filename)
        voice_client.stop()
        await voice_client.disconnect()
    else:
        await context.send('User is not in a voice channel')

@bot.command(
    name='stop',
    help='stop song',
    description='Stops a mp3 being played in the voice channel',
    pass_context=True,
)
async def stop(context):
    # grab the user who sent the command
    guild = context.guild
    user=context.message.author
    channel_name = user.voice.channel.name

    # only play music if user is in a voice channel
    if channel_name!= None:
        # Get voice_client
        voice_client = guild.voice_client

        # disconnect after the player has finished
        voice_client.stop()
        await voice_client.disconnect()
    else:
        await context.send('User is not in a voice channel')

bot.run(TOKEN)

