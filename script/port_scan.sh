#!/bin/bash

EXECUTE_TIME=`date +"%y/%m/%d %H:%M:%S"`
DATE=`date +"%y_%m_%d"`

SCRIPT_PATH="./"
IPLIST=$1
ARGC=$#
SCAN_OPTION=$2
FILE=${SCRIPT_PATH}"result/port_scan_"${DATE}

function need_check() {
	 # Check nmap command
	which nmap > /dev/null 2>&1
	if [[ $? != 0 ]]
	then
        	echo "Can not run the command 'nmap'"
        	exit
	fi

	 # Check IPLIST file
	if [[ ! -f ${IPLIST} ]]
	then
		echo -e "Usage: port_scan [FILE]\n"
		echo "Example: port_scan iplist.txt"
		exit
	fi

	 # Check result folder
	if ! test -e ${SCRIPT_PATH}"result"
	then
        	echo "Create Result directory"
        	mkdir ${SCRIPT_PATH}"result"
	fi

	 # Make result file
	if [[ ! -e ${FILE} ]]
	then
		touch ${FILE}
	else
		rm -rf ${FILE}
		touch ${FILE}
	fi
}

function port_scan() {

	if [[ ${ARGC} -eq 1 ]]
	then
		 # Input Option of port scan range
		echo "Input 1 : Scan default 1000 ports"
		echo "Input 2 : Scan 1-65535 ports"
		echo -n "Input port scan option(1 or 2) : "
		read SCAN_OPTION
	fi

	if [[ ${SCAN_OPTION} == 1 ]]
	then
        	RESULT_SUB="Default 1000 ports - $EXECUTE_TIME"
        	echo "You choice default port scan option"
	elif [[ ${SCAN_OPTION} == 2 ]]
	then
        	RESULT_SUB="All 1-65535 ports - $EXECUTE_TIME"
        	echo "You choice all port scan options"
	else
        	echo "Input wrong option number"
        	exit
	fi

	dos2unix ${IPLIST}

	echo "***************Port Scan***************" | tee -a ${FILE}
	echo "Executed Time - $EXECUTE_TIME" | tee -a ${FILE}
	echo "---------------------------------------" | tee -a ${FILE}

	# Read iplist.txt by one, save in HOST
	while read HOST
	do
        # Print HOST scan start time
        echo "$HOST Port Scanning - `date +"%y/%m/%d %H:%M:%S"`" | tee -a ${FILE}

        # SCAN_OPTION = 1 : default 1000 ports scan
		# SCAN_OPTION =! 1 : 1-65535 ports scan
        if [[ ${SCAN_OPTION} == 1 ]];then
            nmap -sS -T5 ${HOST} | tee -a ${FILE}
        else
            nmap -sS -T5 -p 1-65535 ${HOST} | tee -a ${FILE}
        fi

        echo "---------------------------------------" | tee -a ${FILE}

	# Loop until read all Hosts
	done < ${IPLIST}

	echo "Finished Time - `date +"%y/%m/%d %H:%M:%S"`" | tee -a ${FILE}
	echo "*************Scan Finished*************" | tee -a ${FILE}

}

need_check

port_scan