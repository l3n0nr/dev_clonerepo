#!/bin/bash
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
# Script version:           		[0.0.20.0.0.0]   #
# Date create script:    	  		[09/03/18]       #
# Last modification script: 		[04/04/18]       #
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
# server of the repositories
server="http://www.github.com/lenonr/"

# folder user
local_home=($HOME)

# folder default repositories
LOCAL="$local_home/Github/"

# list repositories
repos=(dev_xfce dev_scripts dev_ksp dev_sysadmin dev_web dev_clonerepo)

# final file git
GIT=".git"

# counter repositories
repo_founds=0
repo_notfounds=0

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
	mkdir $local_home/Github	
fi

# enter folder
cd $local_home/Github
# pwd

# # walk to the array
for (( i = 0; i <= ${#repos[@]}; i++ )); do	
	# verify local repo disk
	if [[ $LOCAL${repos[$i]} != $LOCAL ]]; then
		# verify local repo
		if [ -e "$LOCAL${repos[$i]}" ]; then 	  	 
			printf ""
		  	echo "[+] - Found:" $LOCAL${repos[$i]}

		  	# into folder location
		  	cd $LOCAL${repos[$i]}

		  	# show message - pull repositorie
		  	printf "[*] - Update repositorie, wait.. \n"

		  	# update repositories
		  	git pull

		  	# new line
			printf "\n"

		  	# repo_founds=$(($repo_founds + 1));        
		  	let repo_founds++		  	
		else
			printf ""
			echo "[-] - Not found": $LOCAL${repos[$i]}

		  	# into folder location
		  	cd $LOCAL		  	

		  	# clone repositorie
			git clone $server${repos[$i]}$GIT

			# back folder
		  	cd ..

		  	# new line
			printf "\n"

			# repo_notfounds=$(($repo_notfounds + 1));        
			let repo_notfounds++
		fi
	fi
done	

# static script
printf "##################\n"
printf "Repo founds: $repo_founds\n"
printf "Repo not founds: $repo_notfounds\n"
printf "############################\n"
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# FOOTER
#