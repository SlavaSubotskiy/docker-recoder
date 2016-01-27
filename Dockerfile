# Recoder instance based on latest debian

FROM debian

MAINTAINER anandasattva@gmail.com

COPY ffmpeg-x264-faac-mp3-zvbi_1-1_amd64.deb /tmp/ffmpeg-x264-faac-mp3-zvbi_1-1_amd64.deb

RUN LIST="/etc/apt/sources.list" && \
DEB="deb http://www.deb-multimedia.org wheezy main non-free" && \
DEB_SRC="deb-src http://www.deb-multimedia.org wheezy main non-free" && \
echo "$DEB" >> $LIST && \
echo "$DEB_SRC" >> $LIST && \
apt-get update && \
apt-get -y --force-yes install deb-multimedia-keyring && \
apt-get update && \
apt-get install -y \
    libfaac-dev \
    libmp3lame-dev \
    libx264-dev \
    libzvbi-dev && \
dpkg -i /tmp/ffmpeg-x264-faac-mp3-zvbi_1-1_amd64.deb && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
rm -f /tmp/ffmpeg-x264-faac-mp3-zvbi_1-1_amd64.deb

#ENTRYPOINT udpxy -a ${LISTEN_IP:-0.0.0.0} -p ${LISTEN_PORT:-8080} -c ${MAX_CLIENTS:-10} -T -m ${MCAST_IFACE:-eth1}
