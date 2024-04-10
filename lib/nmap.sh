#!/bin/bash

SYN()
{

xdotool key ctrl+shift+t;sleep 1


xdotool key alt+shift+s ; xdotool type "SynScan" ; xdotool key Return;sleep 1


xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


xdotool type "sudo nmap -sS -sV -O $ip -oX $ip/SYN.xml" ; xdotool key Return

xdotool type "$passwd" ; xdotool key Return

}

noPing()
{

cd ./output

gnome-terminal -- bash -c "sudo nmap -sC -sV -Pn $ip | tee $ip/allPort.txt ; echo ""; read -p 'Press Enter to close...'" 


}

evasion()
{

cd ./output

gnome-terminal -- bash -c "sudo nmap -sF -sV $ip | tee $ip/FIN.txt ; echo ""; read -p 'Press Enter to close...'" 

}


all()
{

SYN $ip

noPing $ip

evasion $ip

}