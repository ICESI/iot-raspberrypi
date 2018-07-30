### Pasos Ethernet Gadget

Una vez se haya copiado la rom de raspbian en la sd, editar los archivos config.txt y cmdline.txt

Adicionar al final del archivo config.txt la línea **dtoverlay=dwc2**

vi /boot/config.txt
```
# For more options and information see
# http://rpf.io/configtxt
# Some settings may impact device functionality. See link above for details

# uncomment if you get no picture on HDMI for a default "safe" mode
#hdmi_safe=1

# uncomment this if your display has a black border of unused pixels visible
# and your display can output without overscan
#disable_overscan=1

# uncomment the following to adjust overscan. Use positive numbers if console
# goes off screen, and negative if there is too much border
#overscan_left=16
#overscan_right=16
#overscan_top=16
#overscan_bottom=16

# uncomment to force a console size. By default it will be display's size minus
# overscan.
#framebuffer_width=1280
#framebuffer_height=720

# uncomment if hdmi display is not detected and composite is being output
#hdmi_force_hotplug=1

# uncomment to force a specific HDMI mode (this will force VGA)
#hdmi_group=1
#hdmi_mode=1

# uncomment to force a HDMI mode rather than DVI. This can make audio work in
# DMT (computer monitor) modes
#hdmi_drive=2

# uncomment to increase signal to HDMI, if you have interference, blanking, or
# no display
#config_hdmi_boost=4

# uncomment for composite PAL
#sdtv_mode=2

#uncomment to overclock the arm. 700 MHz is the default.
#arm_freq=800

# Uncomment some or all of these to enable the optional hardware interfaces
#dtparam=i2c_arm=on
#dtparam=i2s=on
#dtparam=spi=on

# Uncomment this to enable the lirc-rpi module
#dtoverlay=lirc-rpi

# Additional overlays and parameters are documented /boot/overlays/README

# Enable audio (loads snd_bcm2835)
dtparam=audio=on
start_x=1
gpu_mem=128
dtoverlay=dwc2
```

Adicionar despues de la palabra rootwait la línea **modules-load=dwc2,g_ether**

vi /boot/cmdline.txt
```
dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=PARTUUID=53812b09-02 rootfstype=ext4 elevator=dead                                     line fsck.repair=yes rootwait modules-load=dwc2,g_ether
```

### Conexion SSH

Conectar la raspberrypi zero w al computador.

Instalar BonjourPSSetup.exe.

Instalar manualmente el driver RPI OTG de Microsoft.

Conectarse a la raspberrypi zero w usando el comando:
```
ssh pi@raspberrypi.local
```

### Compartir Internet

Adicionar las configuraciones para la interfaz ethernet-usb  

vi /etc/network/interfaces
```
# interfaces(5) file used by ifup(8) and ifdown(8)

# Please note that this file is written to be used with dhcpcd
# For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d

auto lo usb0
iface lo inet loopback

allow-hotplug usb0
iface usb0 inet static
address 192.168.7.2
netmask 255.255.255.0
network 192.168.7.0
broadcast 192.168.7.255
gateway 192.168.7.1
dns-nameservers 8.8.8.8 8.8.4.4
```

### (Opcional) Configuraciones para WiFi

vi /etc/wpa_supplicant/wpa_supplicant.conf
```
country=CO
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="essid1"
    psk="key1"
    key_mgmt=WPA-PSK
    id_str="description1"
}

network={
    ssid="essid2"
    psk="key2"
    key_mgmt=WPA-PSK
    id_str="description2"
}
```

### Referencias
* https://www.raspberrypi.org/forums/viewtopic.php?t=166002
* https://www.ev3dev.org/docs/tutorials/connecting-to-the-internet-via-usb/?os=Windows&os-version=10
