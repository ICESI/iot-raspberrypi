# bot.py
import os
import random

from discord.ext import commands
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

bot = commands.Bot(command_prefix='*')

@bot.command(name='motd', help='Message of the day :hearts:')
async def motd(ctx):
    messages = [
        'I lala you :hearts:',
        '!playtop caraluna',
        'nunca subestimes a nadie, quien menos piensas puede extender su mano para salvarte la vida.'
    ]

    response = random.choice(messages)
    await ctx.send(response)

bot.run(TOKEN)
