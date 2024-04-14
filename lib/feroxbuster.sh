ferox(){

clear 	


echo -e "${B}${LRED}
┌┬┐┌─┐┌─┐┌┬┐┬─┐┌─┐┬ ┬┌─┐┬─┐
 ││├┤ └─┐ │ ├┬┘│ │└┬┘├┤ ├┬┘
─┴┘└─┘└─┘ ┴ ┴└─└─┘ ┴ └─┘┴└─ "

if [[ ! -d ./output/$name/webEnum/ferox ]] 
            then
                mkdir "./output/$name/webEnum/ferox"
            fi



echo -e "${NC}" 
       	echo "${B}" 
	echo -e "[${LBLUE}0${NC}${B}]${CYAN} Feroxbuster"
       	echo -e "${NC}${B}[${LBLUE}1${NC}${B}]${CYAN} Whatweb"
	echo -e "${NC}${B}[${LBLUE}2${NC}${B}]${CYAN} Dnsrecon"
	echo -e "${NC}${B}[${LBLUE}5${NC}${B}]${CYAN} Export results"
	echo -e "${NC}${B}[${FAINTLRED}*${NC}${B}]${CYAN} back"	
	echo ""
	echo -e "${BOLDBLUE}"






}