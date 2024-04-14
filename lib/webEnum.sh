#!/bin/bash

source lib/feroxbuster.sh

webenum(){

clear 	


miniBanner

if [[ ! -d ./output/$name/webEnum ]] 
			then
				mkdir "./output/$name/webEnum"
			fi

insertPasswd



echo -e "${NC}" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} Feroxbuster"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} Whatweb"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} Dnsrecon"
	echo -e "${NC}${B}[${FAINTLRED}*${NC}${B}]${CYAN} back"	
	echo ""
	echo -e "${BOLDBLUE}"

while true 
	do
	

	echo -e "${BOLDBLUE}"	
	read  -p "Select an option: " opt

	echo ""
		case $opt in
	"0") ferox 		;clear	   ; break ;;
	"1") whatWeb    ;clear     ; break ;; 
	"2") echo $name ;clear     ; break ;;
	"*") clear ; banner ; menu ; break ;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done

}

 
whatWeb(){

    xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "Whatweb" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "whatweb -v $domain | tee $name/webEnum/whatweb-$ip.txt "  ; xdotool key Return ; 
    

}