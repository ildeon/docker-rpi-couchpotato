#!/usr/bin/env bash
docker create --name couchpotato-data -v /etc/localtime:/etc/localtime:ro ildeon7/rpi-couchpotato /bin/true
docker run --rm --name couchpotato --volumes-from couchpotato-data -p 5050:5050 ildeon7/rpi-couchpotato
