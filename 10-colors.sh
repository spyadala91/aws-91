#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    R=\e[31m
    G=\e[32m
    Y=\e[33m
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ..$R failure"
        exit 1
    else
        echo -e "$2..$G sucess"
    fi 
  
}
 
if [ $USERID -ne 0 ]
then
   echo "ERROR:: you must have sudo access to execute this script"
   exit 1 #other than 0
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
dnf install mysql -y
VALIDATE $? "installing Mysql"

else
   echo -e $Y "Mysql is already installed"
fi       

dnf list installed git
if [ $? -ne 0 ]
then 
   dnf install git -y
   VALIDATE $? "installing git"
else
   echo -e $Y "git is already..installed"
fi       