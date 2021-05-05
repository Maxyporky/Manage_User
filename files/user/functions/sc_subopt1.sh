#!/bin/bash
function subopt1 {
	echo -e "  ${BOLD}${YELLOW}Usuaris disponibles${NC}"
	echo "----------------------------------------------"
	awk -F: '{if($3>=1000)print "  "$1}' /etc/passwd
	echo "----------------------------------------------"
	echo " "
	
 }