# Recoder instance based debian:jessie

FROM debian:jessie

MAINTAINER anandasattva@gmail.com

RUN LIST="/etc/apt/sources.list" && \
DEB="deb http://www.deb-multimedia.org jessie main non-free" && \
DEB_SRC="deb-src http://www.deb-multimedia.org jessie main non-free" && \
echo "$DEB" >> $LIST && \
echo "$DEB_SRC" >> $LIST && \
apt-get update && \
apt-get -y --force-yes install deb-multimedia-keyring && \
apt-get update && \
apt-get install -y \
    libfaac-dev \
    libmp3lame-dev \
    libx264-dev \
    libzvbi-dev \
	git && \
git clone https://github.com/SlavaSubotskiy/docker-recoder.git /tmp/docker-recoder/ && \
dpkg -i /tmp/docker-recoder/ffmpeg-x264-faac-mp3-zvbi_1-1_amd64.deb && \
apt-get remove -y git && \
apt-get -y autoremove && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /tmp/docker-recoder/

#ENTRYPOINT udpxy -a ${LISTEN_IP:-0.0.0.0} -p ${LISTEN_PORT:-8080} -c ${MAX_CLIENTS:-10} -T -m ${MCAST_IFACE:-eth1}
