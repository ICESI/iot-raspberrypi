FROM resin/raspberry-pi-alpine-python:3.6.1

LABEL author=daniel.barragan@correo.icesi.edu.co
LABEL version=0.1.0

# Enable OpenRC
# ENV INITSYSTEM on

RUN pip install homeassistant
RUN adduser -S homeassistant
#RUN mkdir /home/homeassistant/.homeassistant \
#          chown homeassistant:homeassistant /home/homeassistant/.homeassistant
