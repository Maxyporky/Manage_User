#!/bin/bash

BLUE='\e[96m'
NC='\033[0m' # No Color
BOLD='\e[1m'
RED='\e[91m'
GREEN='\e[92m'


function subopt3 {
 echo "Introdueix nom d'usuari"
 read user

 if [ `id $user 2>/dev/null | wc -l` -eq 0 ]
 		then
 			subopt3 		
	fi
 if [ -z $user ]
	 then 
	 	subopt3
 fi  	


option=0
until [ "$option" = "999" ]; do
	echo " "
	echo "  1.) Descripció"
	echo "  2.) Carpeta arrel"
	echo "  3.) Data d'expiració del compte"
	echo "  4.) Grup principal"
	echo "  5.) Grup secundari"
	echo " "
	printf "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una caracteristica a modificar: "
	read option
	echo ""
		case $option in
		    1) 	
				while [ $? -eq 0 ]
				do
					echo "Introdueix nova descripció"
					read desc 
					sudo usermod -c "$desc" $user
					if [ $? -eq 0 ]
						then
							echo " "  
							echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
							break
						else
							echo -e "${BOLD}${RED}Valor incorrecte${NC}"		
					fi
				done 
				;;
			2) 
				while [ $? -eq 0 ]
				do
					echo "Introdueix nova carpeta arrel"
					read carpeta
					sudo usermod -m $user -d $carpeta 2>/dev/null

					if [ $? -eq 0 ]
					then
						echo " " 
						echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
						break
					else
						echo -e "${BOLD}${RED}Valor incorrecte${NC}"
						
					fi 
				done	
				;;
			3) 
				while [ $? -eq 0 ]
				do 
					echo "Modificar data d'expiració"
					echo "Exemple: YYYY-MM-DD"
					read date
					sudo usermod -e $date $user 2>/dev/null
					if [ $? -eq 0 ]
					then
						echo " " 
						echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
						break
					else
						echo -e "${BOLD}${RED}Valor incorrecte${NC}"
					fi 
				done
				;;
			4) 
				while [ $? -eq 0 ]
				do
					echo "Introdueix grup principal"
					read primary_group
					sudo usermod -g $primary_group $user 2>/dev/null
					if [ $? -eq 0 ]
						then
							echo " " 
							echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
							break
						else
							echo -e "${BOLD}${RED}El grup no existeix o hi ha valors incorrectes!${NC}"
					fi 
				done	
				;;
			5) 
				while [ $? -eq 0 ]
				do
					echo "Introdueix grup secundari"
					read secondary_group
					sudo usermod -G $secondary_group $user 2>/dev/null
					if [ $? -eq 0 ]
						then
							echo " " 
							echo -e "${BOLD}${GREEN}Canvis aplicats!${NC}"
							break
						else
							echo -e "${BOLD}${RED}El grup no existeix o hi ha valors incorrectes!${NC}"
					fi 
				done
				;;				
		    999) 
				cd ..
				source ./sc_users.sh
				gusers
				;;
		    *) 
				subopt3 
		esac
done
 }

 



