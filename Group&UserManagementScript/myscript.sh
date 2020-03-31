#! /bin/bash

#Assignment 9 - Linux Shell Scripting II
#Student: Andressa Machado
#Student number: 040923007
#Course: CST8102 Operating System Fundamentals (GNU/Linux)
#Lab section: 300
#myscript.sh
#04/Dec/2018
#This script has the purpose of user and group management in linux


userInput=n

#script surrounded by a while loop to allow the user to realize the operation as much as they want. userInput == Q quit the program. 
while [ $userInput != "q" ] && [ $userInput != "Q" ]
do

	#clear the command line every time it finish an operation
	clear
	echo "You have the following options: "
	echo "[A] Create a user account" 	
	echo "[B] Delete a user account"
	echo "[C] Change supplementary group for a user account"
	echo "[D] Change initial group for a user account"
	echo "[E] Change default login shell for a user account"
	echo "[F] Change account expiration date for a user account"
	echo "[Q] Quit"
	echo
	echo -e "Option:\c"
	read userInput

	username=n
	groupName=n


	#Option A: Create an user account setting the home directory and the shell for that new user.
	if [ $userInput == "a" ] || [ $userInput == "A" ]
	then
		echo -n "Enter the username: "
		read username

		homeDirectory=n
		echo -n "Enter the home directory: "
		read homeDirectory
		
		loginShell=n
		echo -n "Enter the login shell: "
		read loginShell
		
		#Command to add a new user setting the home directory, creating if it doesnt exist and setting a desireble shell.It asks for the absolute path.
		sudo  useradd -d $homeDirectory -m -s $loginShell $username
		
		echo -n "The user was created."
	

	#Option B: Delete a user account and its home directory.
	elif [ $userInput == "b" ] || [ $userInput == "B" ]
	then
		echo -n "Enter the username to be deleted: "
		read username
		
		#Command to delete the user
		sudo userdel $username
		#Command to delete the directory
		sudo rm -r /home/$username
		
		echo -n "The user and its home directory were deleted."


	#Option C: Change supplementary group for an user account
	elif [ $userInput == "c" ] || [ $userInput == "C" ]
	then 
		echo -n "Enter the username to be added to a supplementary group: "
		read username

		echo -n "Enter the group name to have the user added: "
		read groupName

		#Command to add the user to a supplementary group.
		# Flag -a: allow the user to be added to secundary groups, if omitted, the user will be removed from other groups. Flag -G: refers to a secundary or supplementary group
		sudo usermod -a -G $groupName $username

		echo -n "User added to group."


	#Option D: Change the initial group for a user account
	elif [ $userInput == "d" ] || [ $userInput == "D" ]
	then 
		echo -n "Enter the user name to have the primary group changed: "
		read username
		
		echo -n "Enter the initial group name: "
		read groupName

		#Command to change the primary group
		#Flag -g: refers to the primary group assigned to the user
		sudo usermod -g $groupName $username
		
		echo -n "The primary group was changed."
	

	#Option E: Change default shell for the user account 
	elif [ $userInput == "e" ] || [ $userInput == "E" ]
	then 
		echo -n "Enter the user name to have the shell changed: "
		read username

		shellname=n
		echo -n "Enter the shell name to be used: "
		read shellname

		#Command to change the shell
		#Flag -s: refers to the shell name
		sudo chsh -s /bin/$shellname $username

		echo -n "Shell has been changed."


	#Option F: Change the expiration date for the user account
	elif [ $userInput == "f" ] || [ $userInput == "F" ]
	then
		echo -n "Enter the user name to have the expiration date changed:"
		read username

		expirationDate=n
		echo -n "Enter the expiration date to be used \[YYYY-MM-DD]: " 
		read expirationDate

		#Command to set/change an expiration date to the user
		#Flag -E: refes to the expiration date to be used
		sudo chage -E $expirationDate $username

		echo -n "Expiration date was changed."


	#If the user doesnt press any of the menu options, the program shows an error message.
	elif [ $userInput != "q" ] && [ $userInput != "Q" ] 
	then
		echo -n "Option not found."	

	fi

	#Program sleep for 3 seconds after each menu item is selected, before the loop causes the menu to be redisplayed.
	sleep 3

done 
#end of the program.
