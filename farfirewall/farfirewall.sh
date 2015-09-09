#! /bin/bash
author="barbosafrancakf.tk"
RED="\033[31m"
Yellow="\033[33m"
BWhite="\033[1m"
Green="\e[32m"
Blue="\033[0;36m"
STD="\033[0;0;39m"
Brown="\033[0;33m"
White="\e[4m"
date=$(date +"%m %B, %Y %H:%M %p")
ip=$(curl -s http://ifconfig.me)
scriptname="farfirewall"
servername="$(hostname)"
operatingsystem="$(lsb_release -si)"
operatingsystemrelease="$(lsb_release -sr)"
bits="$(uname -m | sed "s/x86_//;s/i[3-6]86/32/")";
menu() 
{
    clear                                                                                                                                         
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "LYNX${Green}FIRE${RED}WALL${STD} - ${Blue}C O N F I G  M E N U${STD}"
    echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "${Green}[UPDATE]${STD} Hey ${servername}, choose one option: ${RED}${SO}${STD}"
    echo -e "----------------------------------------------------"
    echo -e "${Yellow}1. ${STD}Block"
    echo -e "${Yellow}2. ${STD}Allow"
    echo -e "${Yellow}3. ${STD}Limit"
	echo -e "${Yellow}4. ${STD}Standard Configuration"
	echo -e "${Yellow}5. ${STD}Advanced Configuration"
    echo -e "${Yellow}6. ${STD}Exit"
    echo -e "----------------------------------------------------"
    echo -e "${STD}You're running this script on ${Brown}$operatingsystem $operatingsystemrelease, $bits bits ${STD}"
}

action()
{
    local choice
    read -p "Please, Enter choice [ 1 - 6] " choice
              case $choice in
                      1) block;;
                      2) allow;;
					  3) limit;;
					  4) standard;;
					  5) advanced;;
                      6) quit;;
       *) echo -e "${RED}Error, please insert only numeric values [ 1 - 6] ${STD}" && sleep 1
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

function block()
{
    echo -e "${Green}[farfirewall]${STD} Loading Block ${Green}ME${RED}NU${STD} files..."
	bash /etc/farfirewall/options/block
}

function allow()
{
    echo -e "${Green}[farfirewall]${STD} Loading Allow ${Green}ME${RED}NU${STD} files..."
	bash /etc/farfirewall/options/allow
}

function limit()
{
    echo -e "${Green}[farfirewall]${STD} Loading Limit ${Green}ME${RED}NU${STD} files..."
	bash /etc/farfirewall/options/limit
}

function standard()
{
    echo -e "${Green}[farfirewall]${STD} Loading Standard ${Green}CFG${STD} files..."
	bash /etc/farfirewall/options/standard
}

function advanced()
{
    echo -e "${Green}[farfirewall]${STD} Loading Advanced ${Green}CFG${STD} files..."
	bash /etc/farfirewall/options/advanced
}

trap '' SIGINT SIGQUIT SIGTSTP
while true
do
    menu
    action
done
