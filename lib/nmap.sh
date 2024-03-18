#!/bin/bash

SYN()
{

cd ./output

gnome-terminal -- bash -c "sudo nmap -sC -sV -O $ip | tee $ip/SYN.txt ; echo ""; read -p 'Press Enter to close...'" 

}

allPorts()
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

allPorts $ip

evasion $ip

}