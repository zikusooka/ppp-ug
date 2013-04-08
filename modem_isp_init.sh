#!/bin/sh
# Various functions for initializing modem and querying ISP parameters 

# Variables
# Modem primary channel
DEVICE=`dmesg | grep "GSM modem (1-port) converter now attached to" | head -n1 | sed "s/converter now attached to/a,/" | cut -d , -f2 | sed -e "s/ //g"`
# Determine Modem device
if [ "x$DEVICE" != "x" ];
then
MODEMDEV=/dev/${DEVICE}
else
MODEMDEV=/dev/ttyUSB0
fi
export MODEMDEV
# Modem control channel
DEVICE_NO=`echo ${DEVICE} | sed -e "s/ttyUSB//g"`
let "DEVICE_NO_CTRL_CHANNEL =  $DEVICE_NO + 2"
MODEMCONTROLDEV=/dev/ttyUSB$DEVICE_NO_CTRL_CHANNEL
export MODEMCONTROLDEV



# Reset modem 
reset_modem () {
chat -EVv "" "ATZ" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Put modem on-line
set_modem_online () {
chat -EVv "" "AT+CFUN=1" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for manufacturer of modem
query_modem_brand () {
chat -EVv "" "AT+CGMI" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for model no. of modem
query_modem_model () {
chat -EVv "" "AT+CGMM" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for hardware version of modem
query_modem_hardware_vers () {
chat -EVv "" "AT\^HWVER" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for firmware version of modem
query_modem_firmware_vers () {
chat -EVv "" "AT+CGMR" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for SIM IMSI Number
query_sim_imsi () {
chat -EVv "" "AT+CIMI" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for device EMEI Number
query_modem_emei () {
chat -EVv "" "AT+CGSN" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for device Serial Number
query_modem_serial () {
chat -EVv "" "AT+CGSN" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for Card Lock Statis
query_modem_lock () {
chat -EVv "" "AT\^CARDLOCK?" "OK" "" > $MODEMDEV < $MODEMDEV
# 1- Locked
# 2- Unlocked
# 3- Unlocked foorever
}

# Query for available APNs
query_modem_apn () {
chat -EVv "" "AT+CGDCONT?" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Set network type
set_network_type () {
chat -EVv "" "AT" "OK" "" > $MODEMDEV < $MODEMDEV
chat -EVv "" "AT\^SYSCFG=$@" "OK" "" > $MODEMDEV < $MODEMDEV
}

# Query for available networks
query_networks () {
chat -EVv "" "AT+COPS=?" "OK" "" > $MODEMDEV < $MODEMDEV
}
