# Siri
from flask import Flask
import paho.mqtt.client as paho
import time
import redis
from distutils.util import strtobool

def on_connect(client, userdata, flags, rc):
    print("CONNACK received with code %d." % (rc))
def on_publish(client, userdata, mid):
    print("mid: "+str(mid))

mqtthost = "localhost"
mqttuser = "mqtt_user"
mqttpass = "mqtt_password"
mqtttopic = "cmnd.sonoff_bedroom.POWER"

client = paho.Client()
client.on_connect = on_connect
client.on_publish = on_publish
client.username_pw_set(mqttuser,mqttpass)
client.connect(mqtthost, 1883,60)
client.loop_start()

redis_db = redis.StrictRedis(host="localhost", port=6379, db=0)
redis_db.set('blink', False)
messages = ['OFF', 'ON']

app = Flask(__name__)
@app.route("/lights")
def lights():
    blink_bytes = redis_db.get('blink')
    blink_string = blink_bytes.decode('utf-8')
    blink = strtobool(blink_string)
    (rc, mid) = client.publish(mqtttopic, str(messages[blink]), qos=1)
    message = 'Lights are {}'.format(messages[blink])
    blink = not blink
    redis_db.set('blink', blink)
    return message
