#! /bin/bash
RED="\033[31m";Green="\e[32m";
STD="\033[0;0;39m";
Brown="\033[0;33m";
Green="\e[32m";
ip=$(hostname  -I | cut -f1 -d' ');
operatingsystem="$(lsb_release -si)";
operatingsystemrelease="$(lsb_release -sr)";
bits="$(uname -m | sed "s/x86_//;s/i[3-6]86/32/")";

case "$1" in
  start)
  echo -e "${Green}[TEAMSPEAK]${STD} Starting Teamspeak ${Green}SER${RED}VE${STD}R..."
	bash /opt/teamspeak/server/ts3server_startscript.sh start &> /dev/null
	bash /opt/teamspeak/server/ts3server_startscript.sh status
	echo -e "${Green}[RUN]${STD} Type ${Green}ts3server://${RED}$ip:9987${STD} to connect..."
    ;;
  stop)
   bash /opt/teamspeak/server/ts3server_startscript.sh stop &> /dev/null
	 echo -e "${Green}[TEAMSPEAK]${STD} Shutting down Teamspeak ${Green}SER${RED}VE${STD}R..."
	 bash /opt/teamspeak/server/ts3server_startscript.sh status
    ;;
  status)
	 bash /opt/teamspeak/server/ts3server_startscript.sh status
  ;;
  *)
    echo -e "${STD}You're running this script on ${Brown}$operatingsystem $operatingsystemrelease, $bits bits ${STD}"
    echo -e "Usage: teamspeak {${Green}start${STD}|${RED}stop${STD}|status}"
    exit 1
    ;;
esac
exit 0
