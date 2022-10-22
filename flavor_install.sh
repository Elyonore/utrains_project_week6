#!/bin/bash

command=""
os=$(cat /etc/os-release | grep -i ^id= | awk -F "=" '{print $2}')  
echo $os
if [ $os=="ubuntu" ] 
then 
    command="apt install"
elif [ $os=="alpine" ]
then 
    command="apk add"
else
    command="yum install"
fi

sudo $command -y wget net-utils sysstat finger gcc make python3 epel-release git

echo "Installation complete"
