#!/bin/bash
BLUE='\e[96m'
NC='\033[0m' # No Color
BOLD='\e[1m'

#Menu principal 

#Menu de gestio d'usuaris
function gusers {
clear
figlet -f slant Operatives amb sessions:
	echo -e "Created by \e[5mMGP \e[25m"
	echo " "
option=0
until [ "$option" = "999" ]; do
	echo "  1.) Mostrar els usuaris presents al sistema"
	echo "  2.) Mostrar el llistat total de sessions "
	echo "  3.) Modificar la configuració d’un dels usuaris"
	echo "  4.) Activar o desactivar algun dels usuaris."
	echo "  5.) Crear i esborrar usuaris."
	echo " "
	echo  -e  "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    1) 
			    #Se puede hacer aqui"
				gusers;;
		    2)  
				subopt2;;
		    3) 
				subopt3;;
			4) 
				subopt4;;
			5)
				subopt5;;		
		    999) 
				main_menu;;
		    *)
				gusers 
		esac
done
 }

#submenu opció 2
function subopt2 {
echo "Introdueix nom d'usuari"
read $user

echo " "
echo "Propietats del usuari"
echo "Login"
echo "Descripció"
echo "Carpeta arrel"
echo "Data d’expiració del compte"
echo "Grup principal"
echo "Grups secundaris"
echo "Estat (actiu o inactiu)"
echo " "

option=0
until [ "$option" = "999" ]; do
	echo " "
	echo  -e  "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    999) 
				gusers
				;;
		    *) 
				subopt2 
		esac
done
 }

 function subopt3 {
 	
 echo "Introdueix nom d'usuari"
 read $user

option=0
until [ "$option" = "999" ]; do
	echo "  1.) Descripció"
	echo "  2.) Carpeta arrel"
	echo "  3.) Data d'expiració del compte"
	echo "  4.) Grup principal"
	echo "  5.) Grup secundari"
	echo " "
	echo  -e  "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una caracteristica a modificar: "
	read option
	echo ""
		case $option in
		    1) 
				echo "Modificar Descripció"
				;;
			2) 
				echo "Modificar Carpeta arrel"
				;;
			3) 
				echo "Modificar data d'expiració"
				;;
			4) 
				echo "Modificar grup principal"
				;;
			5) 
				echo "Modificar grup secundari"
				;;				
		    999) 
				gusers
				;;
		    *) 
				subopt3 
		esac
done
 }

 function subopt4 {
 	
 echo "Introdueix nom d'usuari"
 read user

option=0
until [ "$option" = "999" ]; do
	echo "  1.) Activar usuari" $user
	echo "  2.) Desactivar usuari" $user
	echo " "
	echo  -e  "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    1) 
				echo "Activar"
				;;
			2) 
				echo "Desactivar"
				;;
		    999) 
				gusers
				;;
		    *) 
				subopt4 
		esac
done
 }

 function subopt5 {
 	
 echo "Introdueix nom d'usuari"
 read user

option=0
until [ "$option" = "999" ]; do
	echo "  1.) Crear usuari " $user
	echo "  2.) Eliminar" $user
	echo " "
	echo  -e  "${BOLD}${BLUE}  999.) Menu principal${NC}"
	echo " "

	echo -n "Tria una: "
	read option
	echo ""
		case $option in
		    1) 
				echo "Crear"
				;;
			2) 
				echo "Eliminar"
				;;
		    999) 
				gusers
				;;
		    *) 
				subopt5 
		esac
done
 } 


function title {
	echo -e "\e[5mIniciando \e[25m"
	if [ `apt list --installed 2>/dev/null | grep figlet | wc -l` -eq 0 ]
	  then
	  	sudo apt install figlet &>/dev/null
	fi
	clear  	
	
}





