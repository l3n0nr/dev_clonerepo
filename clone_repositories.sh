#!/bin/zsh
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# # # # # # # # # # # # # #
#   	REFERENCES  	  #
# # # # # # # # # # # # # #
#	<http://www.yourownlinux.com/2013/10/working-with-arrays-in-bash-scripting.html>
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # # # # # # # # # # #
#   DEVELOPMENT BY 	  #
# # # # # # # # # # # #
#
# por lenonr(Lenon Ricardo)
#       contato: <lenonrmsouza@gmail.com>
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#									      									  #
#	If I have seen further it is by standing on the shoulders of Giants.      #
#							~Isaac Newton	      							  #
#									      									  #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#
# # # # # # # # # # # # # # # # # # # # # # # ## # # #
# Script version:           		[0.0.10.0.0.0]   #
# Date create script:    	  		[09/03/18]       #
# Last modification script: 		[10/03/18]       #
# # # # # # # # # # # # # # # # # # # # # # # ## # # #
#
# Subtitle: a.b.c.d.e.f
# 	a = alpha[0], beta[1], stable[2], freeze[3];
#
# 	b = errors in execution;
#
# 	c = interactions of the script;
#
# 	d = corrections necessaries;
#
# 	e = pendences;
#
# 	f = development;
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# HEAD
# arrays of repositories
SERVER="http://www.github.com/lenonr/"
LOCAL_HOME=($HOME)
LOCAL="$LOCAL_HOME/Github/"
REPOS=(dev_xfce dev_scripts dev_ksp dev_sysadmin dev_web)
GIT=".git"
#
# Structure
# Step's
# 0 - Find directories
# 1 - Show directories
# 2 - Clone directories not found's in home user
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# BODY
#
### Instructions
# Run script in you home user folder

clear
printf "############################\n"

# create folder not found
if [ -e "$LOCAL" ]; then 	  	 
	printf ""
else
	mkdir $LOCAL_HOME/Github
fi

# # walk to the array
for (( i = 0; i <= ${#REPOS[@]}; i++ )); do	
	# verify local repo disk
	if [[ $LOCAL${REPOS[$i]} != $LOCAL ]]; then
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
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# FOOTER
#