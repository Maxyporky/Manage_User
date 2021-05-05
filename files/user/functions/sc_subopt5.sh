#!/bin/bash

BLUE='\e[96m'
NC='\033[0m' # No Color
BOLD='\e[1m'
RED='\e[91m'
GREEN='\e[92m'


 function subopt5 {

option=0
until [ "$option" = "999" ]; do
	echo -e "  1.) ${BOLD}${GREEN}Crear usuari${NC}"
	echo -e "  2.) ${BOLD}${RED}Eliminar usuari${NC}" 
	echo " "
	printf "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    1) 
				echo "Introdueix el nom de l'usuari"
				read name

				 if [ -z $name ]
					 then 
					 	subopt5
				 fi

				sudo useradd  -s /bin/bash $name
				while [ $? -eq 0 ]
				do
					if [ $? -eq 0 ]
						then
							echo " " 	
							echo -e "${BOLD}${GREEN}Usuari creat!${NC}"
							echo " "
							break
						else 
							echo -e "${BOLD}${RED}Valor incorrecte${NC}"
					fi		
				done
				;;
			2) 	
				echo -e "  ${BOLD}${YELLOW}Usuaris disponibles${NC}"
				echo "----------------------------------------------"
				awk -F: '{if($3>=1000)print "  "$1}' /etc/passwd
				echo "----------------------------------------------"
				echo " "
				
				echo "Introdueix el nom de l'usuari"
				read user

				if [ `id $user 2>/dev/null | wc -l` -eq 0 ]
 					then
 						subopt5				
 				fi

				 if [ -z $user ]
					 then 
					 	subopt5
				 fi
				echo " " 
				echo -e "${BOLD}${RED}#############################${NC}"
				echo "          Warning! "
				echo -e "${BOLD}${RED}#############################${NC}"
				echo " "
				echo " Estas segur? yes/no"
				read 
				if [ $REPLY = yes ]
				then 
					sudo userdel 2>/dev/null $user
					echo " "
					echo "  Usuari eliminat"
					echo " "
				else 
					subopt5
				fi
				;;
		    999)
				cd ..
				source ./sc_users.sh
				gusers
				;;
		    *) 
				subopt5 
		esac
done
 } 