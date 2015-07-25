#! /bin/bash
RED="\033[31m";Yellow="\033[33m";Green="\e[32m";STD="\033[0;0;39m";Brown="\033[0;33m";servername="$(hostname)";operatingsystem="$(lsb_release -si)";operatingsystemrelease="$(lsb_release -sr)";bits="$(uname -m | sed "s/x86_//;s/i[3-6]86/32/")";ip=$(curl -s http://ifconfig.me);date=$(date +"%d-%m-%Y")
echo -e "${Green}[UPDATES]${STD} Listing LINUX ${Green}UP${RED}DA${STD}TES..."
apt-get -qy update &> /dev/null
echo -e "${Green}[UPDATES]${STD} Installing LINUX ${Green}UP${RED}DA${STD}TES..."
apt-get -qy upgrade &> /dev/null
echo -e "${STD}You're running this script on ${Brown}$operatingsystem $operatingsystemrelease, $bits bits ${STD}"
echo -e "${Green}[UPDATES]${STD} Installing LINUX ${Green}Z${RED}I${STD}P libraries..."
apt-get -qy install zip &> /dev/null
echo -e "${Green}[UPDATES]${STD} Installing LINUX ${Green}SS${RED}H${STD}PASS libraries..."
apt-get -qy install sshpass &> /dev/null
echo -e "${Green}[SETUP]${STD} Enter local directory do you want to upload: (${RED}/var/www/${STD})"   
read ldirectory 
echo -e "${Green}[SETUP]${STD} Enter server address to upload your backup files: (${RED}127.0.0.1${STD})"   
read eaddress
echo -e "${Green}[SETUP]${STD} Enter server user to login: (${RED}root${STD})"   
read euser
echo -e "${Green}[SETUP]${STD} Enter server $euser password to complete logging into your server: "   
read epassword
zip -r $date.zip $ldirectory &> /dev/null
echo -e "${Green}[SETUP]${STD} Extracting local files..."   
echo -e "${Green}[SETUP]${STD} Copying files to remote server directory..."   
sshpass -p $epassword ssh -o StrictHostKeyChecking=no $euser@$eaddress echo $'Your server was remotely visited during a file extraction process. > readme.txt'
sshpass -p $epassword scp $date.zip $euser@$eaddress:/root/ 
