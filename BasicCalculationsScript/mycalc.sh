#! /bin/bash

#Assignment 10 - Linux Shell Scripting III
#Student: Andressa MAchado
#Student number: 040923007
#Course: CST8102 Operating System Fundamentals (GNU/Linux)
#Lab section: 300
#mycalc.sh
#04/Dec/2018
#This script has the purpose of perform basic calculations


firstNum=0
secondNum=0
operation=n


#Function to perform the add operation
function add ()
{
	result=$(( $1 + $2 ))
	echo "The sum of $1 plus $2 equals $result"
}

#Function to perform the subtraction operation
function subtract ()
{
	result=$(( $1 - $2 ))
	echo "The subtration of $1 minus $2 equals $result"
}

userInput=n


#If statement to check if the program is receiving three parameters. If so, the second parameter must be an operation sign and the program display the result right away.Otherwise, if no parameters are provided, the program will show a menu to perform the operations.
if [ ! -z "$1" ] && [ ! -z "$2" ] && [ ! -z "$3" ]  
then 
	
	#Checking if the second parameter is a valid operator
	if [ $2 != "+" ] && [ $2 != "-" ]
	then		
		echo "Second parameter must be an operator."
	elif [ $2 == "+" ] 
	then
		#Calling the add function.
		add $1 $3 
	elif [ $2 == "-" ]
        then
		#Calling the subtraction function.
                subtract $1 $3
        fi 			


#In case the parameters were not provided, the program prompts the menu
else 

	#While loop to control if the user press [x] to exit or [c] to continue the program. 
	while [ $userInput != "x" ] && [ $userInput != "X" ]
	do 
		clear
		echo "Menu 1: "
		echo "[C] Calculation "
		echo "[X] Exit "
		echo
		echo -n "Enter an option: "
		read userInput

		#If the user press [c] the program will ask for the integers and the operation signs.
 		if [ $userInput == "c" ] || [ $userInput == "C" ]
		then
			clear
			echo "Menu 2: "
			echo
			echo -n "Please enter an integer number or [x] to exit: "
			read firstNum
			
			#Checking if the user wants to quit the program			
			if [ $firstNum == "x" ] || [ $firstNum == "X" ]
                	then
                        	exit
	
			#If the user enter a number, in other words, if the variable userInput is not null, the program continue asking the desirable operation. 
			elif [ ! -z "$userInput" ]
			then 
				clear
				echo "Menu 3: "
				echo "[+] Add"
				echo "[-] Substration"
				echo "[x] Exit"
				echo
				echo -n  "Enter an option: "
				read operation
				
				#Checking if the user wants to quit the program 				
				if [ $operation == "x" ] || [ $operation == "X" ] 
				then 
					exit
				fi

				#If the user enter for an addition[+] or a subtraction[-], the program continue asking for a second integer.
				if [ $operation == "+" ] || [ $operation == "-" ]
				then 
					clear
					echo "Menu 4: "
					echo
					echo -n "Please enter a second integer or [x] to exit: " 
					read secondNum
					
					#If the user press [x], finalize the program.Otherwise, continue to the operation.
					if [ $secondNum == "x" ] || [ $secondNum == "X" ]
        		        	then
                        			exit

					elif [ ! -z "$operation" ]	        
					then
						clear
						if [ $operation == "+" ] 
						then
							add $firstNum $secondNum
						
						elif [ $operation == "-" ]
						then
							subtract $firstNum $secondNum
						fi

						sleep 3
					fi
				fi
			fi
		fi
	done
fi
#end of the program.
