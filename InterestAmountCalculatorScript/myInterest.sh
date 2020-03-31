#! /bin/bash
#Student: Andressa Machado
#Student number: 040923007
#course: CST8102 Operating System Fundamentals (GNU/Linux)
#course section: 300
#This script has the purpose of calculate the total dollar amount, and display the interest amount.

echo -n "Enter Deposit amount 1: "; read amount1
echo -n "Enter Deposit amount 2: "; read amount2
echo -n "Enter Deposit amount 3: "; read amount3

((total=amount1+amount2+amount3))

echo
echo "You have deposited 3 amounts"
echo "$"$amount1 
echo "$"$amount2
echo "$"$amount3

interestRate=0   

if [ $total -le 3999 ] 
then
   interestRate=0
   result=total     
elif [ $total -ge 4000 ] && [ $total -le 6999 ]  
then 
   interestRate=1
   result+=total*1.01
elif [ $total -ge 7000 ] && [ $total -le 9999 ]
then
   interestRate=2
   result+=total*1.02
elif [ $total -ge 10000 ] && [ $total -le 13999 ]
then
   interestRate=3
   result+=total*1.03
elif [ $total -ge 14000 ] && [ $total -le 17999 ]
then 
   interestRate=4
   result+=total*1.04
elif [ $total -ge 18000 ] && [ $total -le 21999 ]
then 
   interestRate=5
   result+=total*1.05
elif [ $total -ge 22000 ] && [ $total -le 29999 ]
then
   interestRate=6
   result+=total*1.06
elif [ $total -gt 30000 ]
then
   interestRate=7
   result+=total*1.07
fi

echo
echo "These deposit amounts total \$$total, and the interest rate for this deposit amount is $interestRate%."


