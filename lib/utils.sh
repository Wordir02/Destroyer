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
	
	
while true
do
	if CheckIP $ip 

	then
		
		break
	
	fi

done

}


checkDomainFormat()
{
	domain_regex="^http(s)?://([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$"

	if [[ $1 =~ $domain_regex ]]; then
		echo "Domain format is correct."
	else
		echo "Invalid domain format. Please enter a domain in the format http(s)://example.com"
	fi
}

insertDomain()
{

while true

do

	echo -e "${BOLDBLUE}"
	read -p "Enter the domain name(if empty it is set to default ):  " domain 
	echo -e "${NC}"

	if [ -z $domain ] 
	
	then
		domain="http://$ip"
		break


	else
		if checkDomainFormat $domain
		then
			break
		fi

	fi

done
	
}




# function to change the folder and the ip of the target
changeTarget()
{

while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Do you want to create a new folder?(y/n): " opt

	echo ""
		case $opt in
	"y") name='' ;dirName ; insertIp ; clear ; banner ; menu ; break ;;
	"n") insertIp; insertDomain ; clear ; banner ; menu ; break ;; 
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	


done


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



# function to create a directory for collect the output of the target
dirName ()
{
	echo -e "${BOLDBLUE}"
	read -p "Enter the directory name for your target:  " name 
	echo -e "${NC}"

	while true 
	do
		if [ -z $name ] 
		then
			echo -e "${BOLDLRED}dir name can't be empty${NC}"
			dirName
			return 1
		else
			if [[ ! -d ./output/$name ]] 
			then
				mkdir "./output/$name"
			fi
			return 0
			break
		fi
	done
}

