### Wifi

Option 1:

```
# vi /etc/wpa_supplicant/wpa_supplicant.conf
country=CO
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="yourssid"
    psk="yourpskpassword"
    key_mgmt=WPA-PSK
}
```

Option 2

Check that I already have a wifi enabled network interface:

```
# iwconfig
wlan0     IEEE 802.11bgn  ESSID:off/any  
          Mode:Managed  Access Point: Not-Associated   Tx-Power=22 dBm   
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:on
```

Check if wpa_suplicant process is running:

```
# ps -e | grep wpa
1881 ?        00:00:07 wpa_supplicant
```

List available access points:

```
# wpa_cli
> scan
> scan_results
bssid / frequency / signal level / flags / ssid
e0:60:66:7c:81:7f       2417    -66     [WPA2-PSK-CCMP][ESS]    vodafone817E
e0:60:66:61:83:4b       2452    -76     [WPA2-PSK-CCMP][WPS][ESS]       vodafone834A
f8:8e:85:c5:65:c2       2462    -76     [WPA-PSK-CCMP+TKIP][WPS][ESS]   MOVISTAR_65C1
a8:d3:f7:46:0c:be       2472    -83     [WPA-PSK-CCMP+TKIP][WPA2-PSK-CCMP+TKIP][WPS][ESS]       Orange-0CBC

> add_network
> set_network 0 ssid "vodafone817E"
> set_network 0 psk "my-pass-phrase"
Select it as current:

> enable_network 0
Connect to it:

> reconnect
Check the status:

> status
Exit wpa_cli:

> quit
From the shell, request DHCP for an IP and net settings:

# dhclient -r
# dhclient wlan0
```
Option 3

```
nmtui-edit
```
### Power management

```
pi@raspberrypi.local:~ $ vi /etc/rc.local 
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

/sbin/iwconfig wlan0 power off

exit 0
```

### SSH

Poner un archivo de nombre ssh en la partición bootfs para habilitar el ingreso por ssh

```
# touch ssh
```

Poner un archivo de nombre userconf en la partición bootfs para generar un usuario (pi) y contraseña (raspberry)

```
# vi userconf
pi:$6$/4.VdYgDm7RJ0qM1$FwXCeQgDKkqrOU3RIRuDSKpauAbBvP11msq9X58c8Que2l1Dwq3vdJMgiZlQSbEXGaY5esVHGBNbCxKLVNqZW1
```

### Ethernet

Connect raspberry pi to your local network

Run the ping command:
```
# ping raspberrypi.local
```

Connect via ssh using the default user pi and the generated password raspberry:
```
# ssh pi@raspberrypi.local
```

### References
* https://community.blokas.io/t/raspberry-pi-find-raspberry-pis-ip-address/596
