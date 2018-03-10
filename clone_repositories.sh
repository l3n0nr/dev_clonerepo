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
GIT=".git"
LOCAL="/home/lenonr/Github/"

# Structure
# Step's
# 0 - Find directories
# 1 - Show directories
# 2 - Clone directories not found's

#############################
#
# BODY
#
clear
printf "############################\n"

# # walk to the array
for (( i = 0; i <= ${#REPOS[@]}; i++ )); do	
	# verify local repo disk
	if [[ $LOCAL${REPOS[$i]} != $LOCAL ]]; then
		# echo $LOCAL${REPOS[$i]}

		# verify local repo
		if [ -e "$LOCAL${REPOS[$i]}" ]; then 	  	 
		  	echo "[+] - Found:" $LOCAL${REPOS[$i]}
		else
			printf "############################\n"
			echo "[-] - Not found": $LOCAL${REPOS[$i]}
			printf "############################\n"
			printf "Download now!\n"			
			git clone $SERVER${REPOS[$i]}$GIT
		fi
	fi
done	

printf "############################\n"

#############################
#
# FOOTER
#