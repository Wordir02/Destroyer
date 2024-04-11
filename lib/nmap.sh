#!/bin/bash

SYN()
{

    xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "SynScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sS -sV -O $Pn $ip -oX $ip/SYN.xml" ; xdotool key Return

    xdotool type "$passwd" ; xdotool key Return

}


ACK()
{
   xdotool key ctrl+shift+t;sleep 1


    xdotool key alt+shift+s ; xdotool type "AckScan" ; xdotool key Return;sleep 1


    xdotool type "cd ./output" ; xdotool key Return ; xdotool key ctrl+l;sleep 1 


    xdotool type "sudo nmap -sA -sV -O $ip -oX $ip/ACK.xml" ; xdotool key Return

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

evasion()
{

cd ./output

gnome-terminal -- bash -c "sudo nmap -sF -sV $ip | tee $ip/FIN.txt ; echo ""; read -p 'Press Enter to close...'" 

}


all()
{

SYN $ip

ACK $ip

TCP $ip

}