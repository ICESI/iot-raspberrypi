
# bot.py
import os
import random
import asyncio
import discord
from discord.ext.commands import Bot
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')
bot = Bot(command_prefix='*')

@bot.command(
    name='play',
    help='play sound',
    description='Plays a mp3 in the voice channel',
    pass_context=True,
)
async def play(context):
    # grab the user who sent the command
    user=context.message.author
    channel_name = user.voice.channel.name
    channel_voice = user.voice.channel

    # only play music if user is in a voice channel
    if channel_name!= None:
        # create StreamPlayer
        voice_client = await channel_voice.connect()
        player = voice_client.play(FFmpegPCMAudio("/home/daniel/Music/around_the_world.mp3"), after=lambda: print('done'))

        # Check if audio is playing
        while voice_client.is_playing():
            await asyncio.sleep(1)
            
        # disconnect after the player has finished
        voice_client.stop()
        await voice_client.disconnect()
    else:
        await context.send('User is not in a voice channel')

bot.run(TOKEN)
