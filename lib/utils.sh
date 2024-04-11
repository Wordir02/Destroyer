#!/bin/bash


# to insert password for command that requires sudo

insertPasswd()
{

	if [ -z $passwd ] 
	
	then

		echo -e "${BOLDBLUE}"
		read -p "Enter your password for sudo scan:  " passwd 
		echo -e "${NC}"

	fi
}


# function to insert the IP address of the target

insertIp()
{
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
}


# fuction called by insertIp to check if the IP address is valid

CheckIP(){

echo -e "${BOLDBLUE}"
	read -p "Enter an IP address:  " ip 
	echo -e "${NC}"

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    	
		return 0
	else
		echo ""	
    	echo -e "${BOLDLRED}Invalid IP address${NC}"
		return 1
	fi

}


enablePn()
{

while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Enable Pn?(y/n): " opt

	echo ""
		case $opt in
	"y") Pn='-Pn'; break ;;
	"n") Pn='' ; break ;; 
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done

}