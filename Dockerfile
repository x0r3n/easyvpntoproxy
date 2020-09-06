FROM ubuntu:latest

# Evironment variables
ENV DEBIAN_FRONTEND=noninteractive \
    OPENVPN_USERNAME=**None** \
    OPENVPN_PASSWORD=**None** \
    OPENVPN_PROVIDER=**None**
	

RUN apt-get update && apt-get -y install supervisor openvpn dante-server inetutils-ping net-tools

VOLUME /config

ADD openvpn /etc/openvpn

ADD scripts/ /

ADD danted.conf /danted.conf

RUN chmod 775 /start_vpn.sh
RUN chmod 775 /start_danted.sh

ADD supervisord/ /etc/supervisor/conf.d/

EXPOSE 8080
CMD ["supervisord","-n"]

