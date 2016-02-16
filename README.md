[![logo](https://raw.githubusercontent.com/ildeon/docker-rpi-couchpotato/master/logo.png)](https://couchpota.to/)

# Couchpotato for Raspberry pi. (tested on rpi 2 B)
> This docker image is installing couchpotato on your raspberry pi.

# How to run it
```
docker create --name couchpotato-data \
              -v /etc/localtime:/etc/localtime:ro \
              -v <path to config>:/config \
              -v <path to downloads>:/downloads \
              -v <path to movies>:/movies \
              ildeon7/rpi-couchpotato /bin/true

docker run -d -p 5050:5050 --volumes-from couchpotato-data ildeon7/rpi-couchpotato
```
