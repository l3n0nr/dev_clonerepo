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
printf "############################\n"

# # walk to the array
for (( i = 0; i <= ${#REPOS[@]}; i++ )); do	
	# verify local repo disc
	if [[ $LOCAL${REPOS[$i]} != $LOCAL ]]; then
		# echo $LOCAL${REPOS[$i]}

		# verify local repo
		if [ -e "$LOCAL${REPOS[$i]}" ]; then 	  	
		  	# echo "########## LISTA DE ARQUIVOS ##########" 
		  	echo "[+] - Found:" $LOCAL${REPOS[$i]}
		else
			echo "[-] - Not found": $LOCAL${REPOS[$i]}
		fi
	fi

	# git clone $SERVER${REPOS[$i]}
done	

printf "############################\n"

#############################
#
# FOOTER
#