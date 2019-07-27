#!/bin/bash

# color variables
txtrst='\e[1;37m' # White
txtred='\e[1;31m' # Red
txtylw='\e[1;33m' # Yellow
txtpur='\e[1;35m' # Purple
txtgrn='\e[1;32m' # Green

HOSTNAME=`hostname`
CPU_MODEL=`cat /proc/cpuinfo | grep "model name" | uniq -c | awk '{print $5 $6, $7,$8, $9, $10 $11}'`
SERIAL=`dmidecode -t 1 | grep 'Serial Number' | awk '{print $3}'`
KERNEL_INFO=`uname -a | awk '{print $3,$4,$5}'`
CORE_COUNT_PER_CPU=`cat /proc/cpuinfo | grep "cpu cores" | tail -1 | awk '{print $4}'`
MEMORY_SIZE=`cat /proc/meminfo | grep MemTotal | awk '{print $2}'`
DISK_SIZE=`fdisk -l | grep 'Disk /dev' | awk '{gsub(/:/," =");gsub(/,/,"");print substr($2,6),$3,$4,$5}'`
GATEWAY_INFO=`netstat -rn | egrep '^0.0.0.0' | awk '{printf $2 " "}'`


function get_cpu_info() {
    echo -e "CPU Model is $CPU_MODEL"
    echo -e "Serial Number is $SERIAL"
    echo -e "Kernel is $KERNEL_INFO"
    echo -e "Core count per CPU is $CORE_COUNT_PER_CPU"
}

function get_mem_info() {
    echo -e "Memory size is $MEMORY_SIZE"
}

function get_disk_info() {
    echo -e "Disk size is $DISK_SIZE"
}

function get_net_info() {
    echo -e "Gateway is $GATEWAY_INFO"
}

####### COMMAND #############

if [[ $# -ne 1 ]]; then
    echo -e "${txtylw}=======================================${txtrst}"
    echo -e "${txtgrn}  << ${txtpur}${HOSTNAME}${txtgrn} Server Resources >>${txtrst}"
    echo -e "${txtgrn} $0 ${txtred}[all|cpu|mem|disk|net]"
    echo -e "${txtylw}=======================================${txtrst}"
    exit
fi


case "$1" in
	"all" )
		get_cpu_info; get_mem_info; get_disk_info; get_net_info ;;
	* )
		get_$1_info ;;
esac