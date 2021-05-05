#!/bin/bash

BLUE='\e[96m'
NC='\033[0m' # No Color
BOLD='\e[1m'
RED='\e[91m'
GREEN='\e[92m'


function subopt2 {
	echo "Introdueix nom d'usuari"
	read user

	if [ -z $user ]
	 then 
	 	subopt2
 	fi  

	#Comprovar si l'usuari existeix
	if [ `id $user 2>/dev/null | wc -l` -eq 0 ]
 		then
 			subopt2 		
	fi
	

	if [ `groups $user | grep sudo | wc -l` -eq 1 ]
 		then
 			privileges="*" #Te privilegis
 		else
 			privileges=" " #NO te privilegis 
	fi

	#comprovar si estar actiu o no 
	if [ `sudo cat /etc/shadow | grep $user | cut -d ":" -f2 | cut -d "$" -f1` = "!" ]
	then 
		state=`echo -e "${BOLD}${RED}Inactiu${NC}"`
	else 
		state=`echo -e "${BOLD}${GREEN}Actiu${NC}"`
	fi			

		echo " "
		echo -e "  ${BOLD}${YELLOW}Propietats de l'usuari ${RED}$user ${NC}"
		echo "----------------------------------------------"
		printf "%-50s%s\n" "Login:" "$privileges"
		printf "%-50s%s\n" "Descripció:" "`grep $user /etc/passwd | cut -d ":" -f 5`"   
		printf "%-50s%s\n" "Carpeta arrel:" "`grep $user /etc/passwd | cut -d ":" -f 6`"
		printf "%-50s%s\n" "Data d’expiració del compte" "`sudo chage -l $user | cut -d ":" -f2 | sed '4!d'`"
		printf "%-50s%s\n" "Grup principal" "`id -ng $user`"
		printf "%-50s%s\n" "Grups secundaris" "`id -nG $user`"
		printf "%-50s%s\n" "Estat (actiu o inactiu)" "$state" 
		echo "----------------------------------------------"
		echo " "

option=0
until [ "$option" = "999" ]; do
	printf "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option

		case $option in
		    999) 
				cd ..
				source ./sc_users.sh
				gusers
				;;
		    *) 
				subopt2 
		esac
done
}

 



