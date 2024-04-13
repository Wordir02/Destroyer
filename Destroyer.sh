#!/bin/bash


source lib/nmap.sh
source lib/colorcodes.sh
source lib/utils.sh

banner(){
echo -e "${LRED}

	▓█████▄ ▓█████   ██████ ▄▄▄█████▓ ██▀███   ▒█████ ▓██   ██▓▓█████  ██▀███  
	▒██▀ ██▌▓█   ▀ ▒██    ▒ ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▒██  ██▒▓█   ▀ ▓██ ▒ ██▒
	░██   █▌▒███   ░ ▓██▄   ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒ ▒██ ██░▒███   ▓██ ░▄█ ▒
	░▓█▄   ▌▒▓█  ▄   ▒   ██▒░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░ ░ ▐██▓░▒▓█  ▄ ▒██▀▀█▄  
	░▒████▓ ░▒████▒▒██████▒▒  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░ ░ ██▒▓░░▒████▒░██▓ ▒██▒
	 ▒▒▓  ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░   ██▒▒▒ ░░ ▒░ ░░ ▒▓ ░▒▓░
	 ░ ▒  ▒  ░ ░  ░░ ░▒  ░ ░    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ▓██ ░▒░  ░ ░  ░  ░▒ ░ ▒░
	 ░ ░  ░    ░   ░  ░  ░    ░        ░░   ░ ░ ░ ░ ▒  ▒ ▒ ░░     ░     ░░   ░ 
	   ░       ░  ░      ░              ░         ░ ░  ░ ░        ░  ░   ░     
	 ░                                                 ░ ░                     "

echo ""
	 
echo -e "		            ${B}The ultimate penetration tester tool ${NC} "

 }



 menu(){
	
	echo "" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} nmap"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} change target"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} domain"
	echo -e "${NC}${B}[${FAINTLRED}*${NC}${B}]${CYAN} exit"	
	echo ""
	echo ""

	
	while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Select an option: " opt

	echo ""
		case $opt in
	"0") nmap ; break ;;
	"1") changeTarget ; break ;; 
	"2") echo $domain  ; break ;;
	"*") echo -e "${B}${LBLUE}thank you for using our tool!";exit 0 ; break;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done
	
	
}

clear



dirName
insertIp
insertDomain
clear
banner
menu


