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
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} change ip"
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
	"1") insertIp ; break ;; 
	"2") option3  ; break ;;
	"*") echo -e "${B}${LBLUE}thank you for using our tool!";exit 0 ; break;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done
	
	
}



changeIp(){

echo "change ip"

}


nmap(){

clear 	


echo -e "${B}${LRED}
┌┬┐┌─┐┌─┐┌┬┐┬─┐┌─┐┬ ┬┌─┐┬─┐
 ││├┤ └─┐ │ ├┬┘│ │└┬┘├┤ ├┬┘
─┴┘└─┘└─┘ ┴ ┴└─└─┘ ┴ └─┘┴└─ "

insertPasswd



echo -e "${NC}" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} SYN Scan"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} ACK Scan"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} TCP Scan"
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
	"1") ACK $ip ; clear ; nmap  ; break ;; 
	"2") TCP $ip ; clear ; nmap ; break ;;
	"3") all $ip ; clear ; nmap ; break ;;
	"*") clear ; banner ; menu ; break ;;
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
insertIp
menu


