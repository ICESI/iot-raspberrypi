import paho.mqtt.client as paho
import time

mqtthost = "localhost"
mqttuser = "mqtt_user"
mqttpass = "mqtt_password"
mqtttopic = "cmnd.sonoff_bedroom.POWER"

def on_connect(client, userdata, flags, rc):
    print("CONNACK received with code %d." % (rc))
def on_publish(client, userdata, mid):
    print("mid: "+str(mid))

client = paho.Client()
client.on_connect = on_connect
client.on_publish = on_publish
client.username_pw_set(mqttuser,mqttpass)
client.connect(mqtthost, 1883,60)

client.loop_start()

blink = False
messages = ['OFF', 'ON']
delay = 1

while True:
    (rc, mid) = client.publish(mqtttopic, str(messages[blink]), qos=1)
    print('Lights are {}'.format(messages[blink]))
    time.sleep(delay)

    blink = not blink
