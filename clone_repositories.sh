#!/bin/zsh
#############################
# References 
#	<http://www.yourownlinux.com/2013/10/working-with-arrays-in-bash-scripting.html>
#
#############################
#
# HEAD
#
# arrays of repositories
SERVER="http://www.github.com/lenonr/"
REPOS=(dev_xfce dev_scripts dev_ksp dev_sysadmin dev_web)
LOCAL="/home/lenonr/Github/"

#############################
#
# BODY
#
clear
# printf "Clone repositories available\n"
printf "############################\n"

# # walk to the array
for (( i = 0; i <= ${#REPOS[@]}; i++ )); do	
	# verify local repo disc
	if [[ $LOCAL${REPOS[$i]} != $LOCAL ]]; then
		# echo $LOCAL${REPOS[$i]}

		# verificando se arquivo existe
		if [ -e "$LOCAL${REPOS[$i]}" ]; then 	  	
		  	# echo "########## LISTA DE ARQUIVOS ##########" 
		  	# cd $LOCAL${REPOS[$i]}
		  	# ls
		else
			echo "Diretorio '$LOCAL${REPOS[$i]}' nao encontrado"
		fi
	fi

	# if [ -e "$LOCAL$REPOS" ]; then

	# fi

	# echo "$i"
	# git clone $SERVER${REPOS[$i]}
done	

#############################
#
# FOOTER
#