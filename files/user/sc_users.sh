#!/bin/bash
BLUE='\e[96m'
NC='\033[0m' # No Color
BOLD='\e[1m'
YELLOW='\e[93m'


#Menu de gestio d'usuaris
function gusers {
clear
figlet -f slant Gestio usuaris
	echo " "

option=0
until [ "$option" = "999" ]; do
	echo "  1.) Mostrar els usuaris disponibles (només ID 1000 o superior)"
	echo "  2.) Mostrar la configuració d’un dels usuaris"
	echo "  3.) Modificar la configuració d’un dels usuaris"
	echo "  4.) Activar o desactivar algun dels usuaris."
	echo "  5.) Crear i esborrar usuaris."
	echo " "
	printf "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    1) 
			    cd functions
			    source ./sc_subopt1.sh
			    subopt1
				;;
		    2) 
				cd functions
				source ./sc_subopt2.sh
				subopt2
				;;
		    3) 
				cd functions
				source ./sc_subopt3.sh
				subopt3
				;;
			4) 
				cd functions
				source ./sc_subopt4.sh
				subopt4
				;;

			5)
				cd functions
				source ./sc_subopt5.sh
				subopt5
				;;		
		    999) 
				main_menu;;
		    *)
				gusers 
		esac
done
 }


function title {
	printf "\e[5mIniciando \e[25m"
	if [ `apt list --installed 2>/dev/null | grep figlet | wc -l` -eq 0 ]
	  then
	  	sudo apt install figlet &>/dev/null
	fi
	clear  	
	
}





