#! /bin/bash
RED="\033[31m";Yellow="\033[33m";Green="\e[32m";STD="\033[0;0;39m";Brown="\033[0;33m";
block()
{
		echo -e "${RED}[${STD}h${Brown}TUGA${Green}${STD}f${RED}]${STD} - Enter ${Green}IP${STD}/${Green}Prefix${STD} do you want to ${RED}BLOCK${STD}:"   
		read  $network
		iptables -A INPUT -s $network -j DROP
		echo -e "${RED}[${STD}h${Brown}TUGA${Green}${STD}f${RED}]${STD} - Address ${RED}$prefix${STD} have been added to blocked list"
}
usage()
{
		echo -e "${RED}[${STD}h${Brown}TUGA${Green}${STD}f${RED}]${STD} - Usage: htugaf --block 0.0.0.0"
		echo -e "${RED}[${STD}h${Brown}TUGA${Green}${STD}f${RED}]${STD} - Usage: htugaf --prefix 0.0.0.0/24"
		echo -e "${RED}[${STD}h${Brown}TUGA${Green}${STD}f${RED}]${STD} - Usage: htugaf --address 0.0.0.0"
}
invalid()
{
		echo -e "${RED}[${STD}h${Brown}TUGA${Green}${STD}f${RED}]${STD} - You have entered an invalid argument. See: htugaf --help"
}
while :; do
    case $1 in
        -h|-\?|--help)  
            usage
            exit
            ;;
        --address|--prefix|--block)
            block
            exit
            ;;
		--)              
            invalid
            exit
            ;;
        -?*)
            invalid
            exit
            ;;
        *)            
            invalid
            exit
            ;;
			
    esac

    shift
done
