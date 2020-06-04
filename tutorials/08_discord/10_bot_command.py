# bot.py
import os
import random

from discord.ext import commands
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

bot = commands.Bot(command_prefix='*')

@bot.command(name='motd')
async def show_memory(ctx):
    memories = [
        'I lala you :hearts:'
    ]

    response = random.choice(memories)
    await ctx.send(response)

bot.run(TOKEN)
