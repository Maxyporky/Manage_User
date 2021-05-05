#!/bin/bash

BLUE='\e[96m'
NC='\033[0m' # No Color
BOLD='\e[1m'
RED='\e[91m'
GREEN='\e[92m'


function subopt4 {
 	
 echo "Introdueix nom d'usuari"
 read user

 if [ `id $user 2>/dev/null | wc -l` -eq 0 ]
 		then
 			subopt4 		
 fi

 if [ -z $user ]
	 then 
	 	subopt4
 fi 

option=0
until [ "$option" = "999" ]; do
	echo "  1.) Activar usuari" $user
	echo "  2.) Desactivar usuari" $user
	echo " "
	printf "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    1) 	
				sudo usermod -U $user
				while [ $? -eq 0 ]
				do
					if [ $? -eq 0 ]
						then 	
							echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
							echo " "
							break
						else 
							echo -e "${BOLD}${RED}Valor incorrecte${NC}"
					fi		
				done

				;;
			2) 
				
				sudo usermod -L $user
				while [ $? -eq 0 ]
				do
					if [ $? -eq 0 ]
						then 	
							echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
							echo " "
							break
						else 
							echo -e "${BOLD}${RED}Valor incorrecte${NC}"

					fi		
				done 
				;;
		    999) 
				cd ..
				source ./sc_users.sh
				gusers
				;;
		    *) 
				subopt4 
		esac
done
 }


