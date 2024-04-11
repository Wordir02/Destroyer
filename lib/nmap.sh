#!/bin/bash

SYN()
{

    xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "SynScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sS -sV -O $Pn $silent $ip -oX $ip/SYN.xml" ; xdotool key Return

    xdotool type "$passwd" ; xdotool key Return

}


ACK()
{
   xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "AckScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sA -sV -O $ip $silent -oX $ip/ACK.xml" ; xdotool key Return

    xdotool type "$passwd" ; xdotool key Return 
}

TCP()
{

    xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "TcpScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sT -sV -O -Pn $ip -oX $ip/TCP.xml" ; xdotool key Return

    xdotool type "$passwd" ; xdotool key Return


}





# function to enable Pn option in nmap
enablePn()
{

while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Enable Pn?(y/rm): " opt

	echo ""
		case $opt in
	"y") Pn='-Pn'; break ;;
	"rm") Pn='' ; break ;; 
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done

}



silent()
{

while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Enable silent flag?(y/rm): " opt

	echo ""
		case $opt in
	"y") silent='-Pn -n --disable-arp-ping'; break ;;
	"rm") silent='' ; break ;; 
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done

}



export()
{

    cd ./output/$ip

    for file in ./*
    do
        filename=$(basename "$file")
        filename="${filename%.*}"
        xsltproc "$file" -o "${filename}.html"
    done

}



all()
{

SYN $ip

ACK $ip

TCP $ip

}