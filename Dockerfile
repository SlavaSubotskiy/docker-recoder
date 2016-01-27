# Recoder instance based on latest debian

FROM debian

MAINTAINER anandasattva@gmail.com


#ADD udpxy /usr/bin/

#ENTRYPOINT udpxy -a ${LISTEN_IP:-0.0.0.0} -p ${LISTEN_PORT:-8080} -c ${MAX_CLIENTS:-10} -T -m ${MCAST_IFACE:-eth1}
