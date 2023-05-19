#!/bin/bash
clear

figlet shreyas

# 
printf "1. Get information about your computer and network\n"
printf "2. Get information about another computer or a network\n"

printf "\n"
printf "0. Exit ->\n"
printf "\n"

read -p "@gopnarayanshreyas : " sel1

if [ $sel1 = 0 ]
 then
  exit
fi

while [ $sel1 = 1 ]; do

  printf "=========================*==========*=========================\n"
  
  printf "\n"
  printf "1. Your IP & MAC address\n"
  printf "2. Your Network Statistics\n"
  printf "3. Your Ethernet Devices\n"

  printf "\n"
  printf "0. Exit ->\n"
  printf "\n"

  read -p "@gopnarayanshreyas : " sel2

  if [ $sel2 = 1 ]
   then
    
    ip addr show
    printf "\n"
   fi

  if [ $sel2 = 2 ]
   then
    netstat
    printf "\n"
  fi

  if [ $sel2 = 3 ]
   then
    printf "\n"
    sudo ethtool eth0
    printf $END
  fi

  if [ $sel2 = 0 ]
   then
     exit
  fi
done

if [ $sel1 = 2 ]
 then
  read -p "Domain name or IP Address : " webaddr
fi

while [ $sel1 = 2 ]; do
  printf "=========================*==========*=========================\n"

  printf "\n"

  printf "1. IP Address\n"
  printf "2. Scan all ports\n"
  printf "3. Scan a specific port\n"
  printf "4. Scan most common 100 ports\n"
  printf "5. Find [CNAMES] Alias Domain Names\n"
  printf "6. Domain Information Groper\n"
  printf "7. Records\n"

  printf "\n"
  printf "0. Exit ->\n"
  printf "\n"

  read -p "@gopnarayanshreyas : " sel2

  if [ $sel2 = 1 ]
   then
    
    sudo host $webaddr
    printf "\n"
   fi

  if [ $sel2 = 2 ]
   then
    sudo nmap $webaddr
    printf "\n"
  fi

  if [ $sel2 = 3 ]
   then
    read -p "Port Number : " port
    
    sudo nmap -p $port $webaddr 
    printf "\n"
  fi

  if [ $sel2 = 4 ]
   then
    sudo nmap -F $webaddr 
    printf "\n"
  fi

  if [ $sel2 = 5 ]
   then
    
    sudo host -t CNAME $webaddr
    printf "\n"
  fi

  if [ $sel2 = 6 ]
   then
    sudo dig $webaddr any
  fi

  if [ $sel2 = 7 ]
   then
    sudo whois $webaddr
  fi

  if [ $sel2 = 0 ]
   then
     exit
  fi
done
