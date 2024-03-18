#!/bin/bash


source lib/nmap.sh
source lib/colorcodes.sh

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
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} mod 2"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} mod 3"
	echo -e "${NC}${B}[${FAINTLRED}*${NC}${B}]${CYAN} exit"	
	echo ""
	echo ""

	
	while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Select your option: " opt

	echo ""
		case $opt in
	"0") nmap ; break ;;
	"1") option2 ; break ;; 
	"2") option3  ; break ;;
	"*") exit 0 ; break ;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done
	
	
}


CheckIP(){

echo -e "${BOLDBLUE}"
	read -p "Enter the IP address:  " ip 

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    	
		return 0
	else
		echo ""	
    	echo -e "${LRED}Invalid IP address${NC}"
		return 1
	fi

}


nmap(){

clear 	

echo -e "${B}${LRED}
┌┬┐┌─┐┌─┐┌┬┐┬─┐┌─┐┬ ┬┌─┐┬─┐
 ││├┤ └─┐ │ ├┬┘│ │└┬┘├┤ ├┬┘
─┴┘└─┘└─┘ ┴ ┴└─└─┘ ┴ └─┘┴└─ "


if [ -z $ip ]; then
	
while true
do
	if CheckIP $ip 

	then


		if [[ ! -d ./output/$ip ]] 
		then
			mkdir "./output/$ip"
		fi


		break
	fi

done

fi


echo -e "${NC}" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} SYN Scan"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} Pn Scan"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} Firewall Evasion"
	echo -e "${NC}${B}[${LBLUE}3${NC}${B}]${CYAN} All"
	echo -e "${NC}${B}[${FAINTLRED}*${NC}${B}]${CYAN} back"	
	echo ""
	echo -e "${BOLDBLUE}"

while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Select your option: " opt

	echo ""
		case $opt in
	"0") SYN $ip ; clear ; nmap ; break ;;
	"1") allPorts $ip ; clear ; nmap  ; break ;; 
	"2") evasion $ip ; clear ; nmap ; break ;;
	"3") all $ip ; clear ; nmap ; break ;;
	"*") ip="" ;clear ; banner ; menu ; break ;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done

}


optione2(){

echo "option 2"	

}


option3(){

echo "option 3"

}


banner
menu


