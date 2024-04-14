#!/bin/bash


nmap(){

clear 	


echo -e "${B}${LRED}
┌┬┐┌─┐┌─┐┌┬┐┬─┐┌─┐┬ ┬┌─┐┬─┐
 ││├┤ └─┐ │ ├┬┘│ │└┬┘├┤ ├┬┘
─┴┘└─┘└─┘ ┴ ┴└─└─┘ ┴ └─┘┴└─ "

if [[ ! -d ./output/$name/nmap ]] 
			then
				mkdir "./output/$name/nmap"
			fi





echo -e "${NC}" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} SYN Scan"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} ACK Scan"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} TCP Scan"
	echo -e "${NC}${B}[${LBLUE}3${NC}${B}]${CYAN} enable Pn"
	echo -e "${NC}${B}[${LBLUE}4${NC}${B}]${CYAN} enable silent scan"
	echo -e "${NC}${B}[${LBLUE}5${NC}${B}]${CYAN} Export results"
	echo -e "${NC}${B}[${FAINTLRED}*${NC}${B}]${CYAN} back"	
	echo ""
	echo -e "${BOLDBLUE}"

while true 
	do

	echo -e "${BOLDBLUE}"	
	read  -p "Select an option: " opt

	echo ""
		case $opt in
	"0") SYN $ip $name ; clear ; nmap ; break ;;
	"1") ACK $ip $name ; clear ; nmap  ; break ;; 
	"2") TCP $ip $name ; clear ; nmap ; break ;;
	"3") enablePn $ip  ; clear ; nmap ; break ;;
	"4") silent $ip ; clear ; nmap ; break ;;
	"5") export $name ;sleep 5; clear ; nmap ; break ;;
	"*") clear ; banner ; menu ; break ;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done

}


SYN()
{

    xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "SynScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sS -sV -O $Pn $silent $ip -oX $name/nmap/$ip-SYN.xml" ; xdotool key Return

    xdotool type "$passwd" ; xdotool key Return

}


ACK()
{
   xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "AckScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sA -sV -O $ip $silent -oX $name/nmap/$ip-ACK.xml" ; xdotool key Return

    xdotool type "$passwd" ; xdotool key Return 
}

TCP()
{

    xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "TcpScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sT -sV -O -Pn $ip -oX $name/nmap/$ip-TCP.xml" ; xdotool key Return

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


# easy way to enable silent flags in nmap
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

    cd ./output/$name

    for file in ./*.xml;
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