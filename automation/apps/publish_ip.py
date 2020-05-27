import requests
import json

# https://crontab.guru/#*/15_*_*_*_*
# https://crontab-generator.org/
# crontab -e
# m h  dom mon dow   command
# 0 * * * * python /home/pi/repositories/public-access/publish_ip.py

# “At minute 0.”
# at 2020-05-27 12:00:00
# then at 2020-05-27 13:00:00
# then at 2020-05-27 14:00:00
# then at 2020-05-27 15:00:00
# then at 2020-05-27 16:00:00

response = requests.get('https://api.ipify.org?format=json')
data = json.loads(response.text)
ip = data["ip"]
print(ip)

slack_url = 'https://hooks.slack.com/services/xyz/xyz/xyz'
slack_payload = {
    'text': 'Current ip address is {0}'.format(ip)
}
headers = {
    'Content-Type': 'application/json'
}
response = requests.post(slack_url, json=slack_payload, headers=headers)
print(response.text)
