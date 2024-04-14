ferox(){

clear 	


miniBanner

if [[ ! -d ./output/$name/webEnum/ferox ]] 
            then
                mkdir "./output/$name/webEnum/ferox"
            fi



echo -e "${NC}" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} Base Scan"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} Https no certificate"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} verbose"
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
	"0") base 		;clear  ; break ;;
	"1") noSsl  	;clear  ; break ;; 
	"2") verbose 	;clear  ; break ;;
	"3") enablePn  	;clear  ; break ;;
	"*") clear 		;banner ; menu 	; break ;;
	  *) echo -e "${LRED}Invalid option. Please select a valid option.${NC} ";;

	esac	

	done



}


base()
{
	xdotool key ctrl+shift+t;sleep 1
	xdotool key alt+shift+s ; xdotool type "baseFeroxbuster" ; xdotool key Return;sleep 1
	xdotool type "feroxbuster -u $domain  -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -o ./output/$name/webEnum/ferox/$ip-ferox.txt" ; xdotool key Return;sleep 1

}

noSsl()
{
	xdotool key ctrl+shift+t;sleep 1
	xdotool key alt+shift+s ; xdotool type "baseFeroxbuster" ; xdotool key Return;sleep 1
	xdotool type "feroxbuster -u $domain -k -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -o ./output/$name/webEnum/ferox/$ip-ferox.txt" ; xdotool key Return;sleep 1

}


verbose()
{
	xdotool key ctrl+shift+t;sleep 1
	xdotool key alt+shift+s ; xdotool type "baseFeroxbuster" ; xdotool key Return;sleep 1
	xdotool type "feroxbuster -u $domain -v -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -o ./output/$name/webEnum/ferox/$ip-ferox.txt" ; xdotool key Return;sleep 1

}