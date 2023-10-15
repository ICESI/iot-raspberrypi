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

Poner un archivo ssh y userconf en la partición /bootfs

```
touch ssh

vi userconf
pi:$6$/4.VdYgDm7RJ0qM1$FwXCeQgDKkqrOU3RIRuDSKpauAbBvP11msq9X58c8Que2l1Dwq3vdJMgiZlQSbEXGaY5esVHGBNbCxKLVNqZW1
```

### Ethernet

Connect raspberry pi to your local network

Run the ping command:
```
ping raspberrypi.local
```

Connect via ssh using the default user pi and the generated password raspberry:
```
ssh pi@raspberrypi.local
```

### References
* https://community.blokas.io/t/raspberry-pi-find-raspberry-pis-ip-address/596
