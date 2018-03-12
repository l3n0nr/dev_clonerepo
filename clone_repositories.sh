#!/bin/zsh
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# # # # # # # # # # # # # #
#   	REFERENCES  	  #
# # # # # # # # # # # # # #
#
# Working with 'Arrays' in BASH Scripting
#	<http://www.yourownlinux.com/2013/10/working-with-arrays-in-bash-scripting.html>
#
# Unix scripts: how to sum numbers up
# 	<https://www.unixtutorial.org/2009/02/unix-scripts-how-to-sum-numbers-up/>
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
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
# Script version:           		[0.0.15.0.0.0]   #
# Date create script:    	  		[09/03/18]       #
# Last modification script: 		[11/03/18]       #
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
local SERVER="http://www.github.com/lenonr/"
local LOCAL_HOME=($HOME)
local LOCAL="$LOCAL_HOME/Github/"
local REPOS=(dev_xfce dev_scripts dev_ksp dev_sysadmin dev_web dev_clonerepo)
local GIT=".git"
local REPO_FOUNDS=0
local REPO_NOTFOUNDS=0
#
# Structure
# Step's
# 0 - Find directories
# 1 - Show directories
# 2 - Clone directories not found's in folder $LOCAL
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# BODY
#
### Instructions
# Run script in you home user folder and take it your coffee!! ;-)

clear
printf "############################\n"

if [ -e "$LOCAL" ]; then 	  	 
	printf ""
else
	# create folder not found
	mkdir $LOCAL_HOME/Github	
fi

# enter folder
cd $LOCAL_HOME/Github
# pwd

# # walk to the array
for (( i = 0; i <= ${#REPOS[@]}; i++ )); do	
	# verify local repo disk
	if [[ $LOCAL${REPOS[$i]} != $LOCAL ]]; then
		# verify local repo
		if [ -e "$LOCAL${REPOS[$i]}" ]; then 	  	 
			printf ""
		  	echo "[+] - Found:" $LOCAL${REPOS[$i]}

		  	# REPO_FOUNDS=$(($REPO_FOUNDS + 1));        
		  	let REPO_FOUNDS++		  	
		else
			printf ""
			echo "[-] - Not found": $LOCAL${REPOS[$i]}
			printf "Download now!\n"			
			git clone $SERVER${REPOS[$i]}$GIT

			# REPO_NOTFOUNDS=$(($REPO_NOTFOUNDS + 1));        
			let REPO_NOTFOUNDS++
		fi
	fi
done	

# static script
printf "##################\n"
printf "Repo founds: $REPO_FOUNDS\n"
printf "Repo not founds: $REPO_NOTFOUNDS\n"
printf "############################\n"
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# FOOTER
#