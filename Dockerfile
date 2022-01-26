FROM linuxserver/qbittorrent:latest

# install packages for AutoDL-IRSSI

RUN \
apk add --no-cache \
		perl \
		perl-archive-zip \
		perl-net-ssleay \
		perl-html-parser \
		perl-xml-libxml \
		perl-digest-sha3 \
		perl-json \
		perl-json-xs \
		curl \
		bash \
		dtach \
		git \
		nano \
		irssi \
		irssi-perl
		
COPY root/ /

VOLUME /config