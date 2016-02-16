FROM armbuild/debian:jessie
MAINTAINER ildeon

RUN apt-get update &&\
    apt-get install git-core libffi-dev libssl-dev zlib1g-dev libxslt1-dev libxml2-dev python python-pip python-dev build-essential -y

RUN pip install lxml cffi cryptography pyopenssl --upgrade &&\
    adduser --system -shell "/bin/bash" --uid 1000 --disabled-password --group --home /var/lib/couchpotato couchpotato &&\
    groupadd media && \
    usermod -a -G media couchpotato && \
  apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

RUN cd /var/lib/couchpotato && git clone https://github.com/RuudBurger/CouchPotatoServer.git &&\
    chown -R couchpotato:couchpotato /var/lib/couchpotato/CouchPotatoServer/

EXPOSE 5050

RUN mkdir /config && chown -R couchpotato:couchpotato /config &&\
    mkdir /movies && chown -R couchpotato:media /movies &&\
    mkdir /download && chown -R couchpotato:media /download

VOLUME ["/config", "/movies", "/download"]

USER couchpotato

CMD /bin/bash -c "umask 002;/usr/bin/python /var/lib/couchpotato/CouchPotatoServer/CouchPotato.py --console_log --data_dir /config/data --config_file /config/settings.conf"
