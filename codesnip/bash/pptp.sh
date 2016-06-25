#!/bin/bash - 
#===============================================================================
#
#          FILE: pptp.sh
# 
#         USAGE: ./pptp.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2016年06月25日 17时02分48秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
if [ $# -lt 1 ];then
	echo "input on/off, $#"
	exit 0
fi

PPTP_SERVER=x.x.x.x
PPTP_USER=xxx
PPTP_PASSWORD=xxx
DNS=x.x.x.x
GATEWAY=x.x.x.x
PPTP_DNS=x.x.x.x
PPTP_GATE=x.x.x.x

pptpon(){
	sudo pptpsetup --create testvpn --server ${PPTP_SERVER} --username ${PPTP_USER} --password ${PPTP_PASSWORD} --encrypt --start
	sudo route add default gw ${PPTP_GATE}
	sudo sed -i 's/${DNS}/${PPTP_DNS}/g' /etc/resolv.conf
}

pptpoff(){
	sudo poff	
	sudo route del default gw ${GATEWAY}
	sudo sed -i 's/${PPTP_DNS}/${DNS}/g' /etc/resolv.conf
}

case "${1}" in
	on)
		pptpon
	;;
	off)
		pptpoff
	;;
esac
