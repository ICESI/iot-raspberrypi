# bot.py
import os
import random
import os
import asyncio
from discord import Client
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')
client = Client()

@client.event
async def on_message(message):
    if message.content.startswith('$greet'):
        channel = message.channel
        await channel.send('Say hello!')

        def check(message):
            return message.content == 'hello' and message.channel == channel

        try:
            msg = await client.wait_for('message', timeout=30.0, check=check)
        except asyncio.TimeoutError:
            await channel.send(':sunglasses:')
        else:
            await channel.send('Hello {.author}!'.format(msg))

client.run(TOKEN)
