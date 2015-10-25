#! /bin/bash
RED="\033[31m";Green="\e[32m";STD="\033[0;0;39m";Brown="\033[0;33m";Green="\e[32m";ip=$(hostname  -I | cut -f1 -d' ');operatingsystem="$(lsb_release -si)";operatingsystemrelease="$(lsb_release -sr)";bits="$(uname -m | sed "s/x86_//;s/i[3-6]86/32/")";
menu() 
{
    clear
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "LYNX${Green}MONI${RED}TOR${STD} - ${Blue}D E F A U L T  S C R I P T ${STD}"
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "${Green}[UPDATE]${STD} Hey ${servername}, choose one option: ${RED}${SO}${STD}"
    echo -e "----------------------------------------------------"
    echo -e "${Yellow}1. ${STD}Counter Strike Global Offensive"
	echo -e "${Yellow}2. ${STD}Counter Strike"
    echo -e "${Yellow}3. ${STD}Exit"
    echo -e "----------------------------------------------------"
    echo -e "${STD}You're running this script on ${Brown}$operatingsystem $operatingsystemrelease, $bits bits ${STD}"	
}
  
rs()
{
    local choice
    read -p "Please, Enter choice [ 1 - 3] " choice
              case $choice in
                      1) csgo;;
					  2) cs;;
                      3) quit;;
       *) echo -e "${RED}Error, please insert only numeric values [ 1 - 3] ${STD}" && sleep 1
    esac
}
  
function quit()
{
    echo -ne "${RED}[CLOSING]${STD}[#####                     ](${RED}33%${STD})\r"
    echo -ne "${RED}[CLOSING]${STD}[#############             ](${RED}66%${STD})\r"
    echo -ne "${RED}[CLOSING]${STD}[###############           ](${RED}66%${STD})\r"
    sleep 0.34
    echo -ne "${RED}[CLOSING]${STD}[#################         ](${RED}66%${STD})\r"
    sleep 0.40
    echo -ne "${RED}[CLOSING]${STD}[#######################   ](${RED}86%${STD})\r"
    sleep 0.45
    echo -ne "${RED}[CLOSING]${STD}[##########################](${RED}100%${STD})\r"
    echo -ne '\n'
    clear
    exit 0
}
function csgo()
{
	clear
	echo -e "${Green}[UPDATE]${STD} Reading C${Green}SG${RED}O${STD} files..."
	echo -e "${Green}[UPDATE]${STD} Listing LINUX ${Green}UP${RED}DA${STD}TES..."
    apt-get -y update &> /dev/null
    echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}UP${RED}DA${STD}TES..."
    apt-get -y upgrade &> /dev/null
	echo -e "${STD}You're running this script on ${Brown}$operatingsystem $operatingsystemrelease, $bits bits ${STD}"
    sleep 0.25
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}lib32${RED}gcc${STD}..."
	apt-get -y  install lib32gcc1 libc6-i386 lib32stdc++6 &> /dev/null
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}NA${RED}NO${STD}..."
	apt-get -y install nano &> /dev/null
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}SCRE${RED}EN${STD}..."
    apt-get -y install screen &> /dev/null
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}i${RED}386${STD} architecture..."
	dpkg --add-architecture i386
	echo -e "${Green}[UPDATE]${STD} Listing LINUX ${Green}UP${RED}DA${STD}TES..."
    apt-get -y update &> /dev/null
	mkdir /opt/Steam
	wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O /opt/Steam/steam.tar.gz
	tar -zxvf /opt/Steam/steam.tar.gz -C /opt/Steam
    echo -e "Enter server ${Green}PORT${STD} to run up your ${Brown}Counter Strike ${STD}Server: "
		read -p "->" port
	echo -e "Enter server ${RED}NA${Blue}ME${STD} to ${Brown}Counter Strike Global Offensive ${STD}Server: "
		read -p "->" name
	echo -e "Enter server ${RED}RC${Blue}ON${STD} to ${Brown}Counter Strike Global Offensive ${STD}Server: "
		read -p "->" rcon
	echo -e "Enter server ${RED}PASS${Blue}W${Yellow}ORD${STD} to ${Brown}Counter Strike Global Offensive ${STD}Server: "
		read -s -p "->" password

	bash /opt/Steam/steamcmd.sh +login anonymous +force_install_dir /opt/Steam/$port +app_update 740 validate +quit
	touch /opt/Steam/$port/csgo/cfg/server.cfg

	echo "hostname '$name' " > /opt/Steam/$port/csgo/cfg/server.cfg
	echo "rcon_password '$rcon' " >> /opt/Steam/$port/csgo/cfg/server.cfg
	echo "hostname '$rcon' " > /opt/Steam/$port/csgo/cfg/server.cfg
	echo "sv_password '$password' " >> /opt/Steam/$port/csgo/cfg/server.cfg
	echo -e "${Green}[CSGO]${STD} Starting ${Brown}Counter Strike Global Offensive ${STD}Server..."
	sleep 1
	screen -S CSGO_$port /opt/Steam/$port/./srcds_run -game csgo -console -usercon -tickrate 128 +game_type 0 +net_public_adr $ip +ip $ip -port $port +game_mode 1 +mapgroup mg_bomb +map de_dust2
	echo -e "connect ${RED}$ip${STD}:${Green}$port${STD};password ${blue}$password"	
}
function cs()
{
	clear
    echo -e "${Green}[UPDATE]${STD} Reading C${Green}SG${RED}O${STD} files..."
	echo -e "${Green}[UPDATE]${STD} Listing LINUX ${Green}UP${RED}DA${STD}TES..."
    apt-get -y update &> /dev/null
    echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}UP${RED}DA${STD}TES..."
    apt-get -y upgrade &> /dev/null
	echo -e "${STD}You're running this script on ${Brown}$operatingsystem $operatingsystemrelease, $bits bits ${STD}"
    sleep 0.25
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}lib32${RED}gcc${STD}..."
	apt-get -y  install lib32gcc1 libc6-i386 lib32stdc++6 &> /dev/null
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}NA${RED}NO${STD}..."
	apt-get -y install nano &> /dev/null
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}SCRE${RED}EN${STD}..."
    apt-get -y install screen &> /dev/null
	echo -e "${Green}[UPDATE]${STD} Installing LINUX ${Green}i${RED}386${STD} architecture..."
	dpkg --add-architecture i386
	echo -e "${Green}[UPDATE]${STD} Listing LINUX ${Green}UP${RED}DA${STD}TES..."
    apt-get -y update &> /dev/null
	mkdir /opt/Steam
	wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O /opt/Steam/steam.tar.gz
	tar -zxvf /opt/Steam/steam.tar.gz -C /opt/Steam
    echo -e "Enter server ${Green}PORT${STD} to run up your ${Brown}Counter Strike ${STD}Server: "
		read -p "->" port
	echo -e "Enter server ${RED}NA${Blue}ME${STD} to ${Brown}Counter Strike 1.6 ${STD}Server: "
		read -p "->" name
	echo -e "Enter server ${RED}RC${Blue}ON${STD} to ${Brown}Counter Strike Global Offensive ${STD}Server: "
		read -p "->" rcon	
	echo -e "Enter server max ${Green}players${STD}: "  
		read -p "->" maxplayers
	echo -e "Enter server ${RED}PASS${Blue}W${Yellow}ORD${STD} to ${Brown}Counter Strike 1.6 ${STD}Server: "
		read -s -p "->" password
	
	bash /opt/Steam/steamcmd.sh +login anonymous +force_install_dir /opt/Steam/$port +app_set_config 90 mod cstrike +app_update "90 -beta" validate +quit
	cat /dev/null > /opt/Steam/$port/cstrike/server.cfg
	touch ~/opt/Steam/$port/cstrike/listip.cfg
	touch ~/opt/Steam/$port/cstrike/banned.cfg

	echo "hostname '$name' " >> /opt/Steam/$port/cstrike/server.cfg
	echo "rcon_password '$rcon' " >> /opt/Steam/$port/cstrike/server.cfg
	echo "sv_password '$password' " >> /opt/Steam/$port/cs/cfg/server.cfg

	echo -e "${Green}[CSGO]${STD} Starting ${Brown}Counter Strike 1.6 ${STD}Server..."
	sleep 1
	screen -S CSGO_$port /opt/Steam/$port/./srcds_run -game cstrike -autoupdate -pingboost 2 -port $port +maxplayers $maxplayers +map de_dust2
	echo -e "connect ${RED}$ip${STD}:${Green}$port${STD};password ${blue}$password"	
}
trap '' SIGINT SIGQUIT SIGTSTP
while true
do
    menu
    rs
done
