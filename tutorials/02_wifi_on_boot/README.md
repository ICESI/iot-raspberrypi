### Wifi

```
vi /etc/wpa_supplicant/wpa_supplicant.conf
```

```
country=CO
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="yourssid"
    psk="yourpskpassword"
    key_mgmt=WPA-PSK
}
```

Poner un archivo ssh en la partición /bootfs

```
touch ssh
```


### Ethernet

Connect raspberry pi to your local network

Run the ping command:
```
ping raspberrypi.local
```

Connect via ssh:
```
ssh pi@raspberrypi.local
```

### References
* https://community.blokas.io/t/raspberry-pi-find-raspberry-pis-ip-address/596
