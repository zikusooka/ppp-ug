 ____  ____  ____       _   _  ____ 
|  _ \|  _ \|  _ \     | | | |/ ___|
| |_) | |_) | |_) |____| | | | |  _ 
|  __/|  __/|  __/_____| |_| | |_| |

|_|   |_|   |_|         \___/ \____|
 

Introduction:

PPP-UG is a command line utility that can be used to connect to the
Internet via mobile ISPs based in Uganda.  Tested networks include: Africell, MTN, Airtel, Smart, Vodafone and UTL.  Other networks like Smile should also work with little or no modifications.

PPP-UG is a collection of bash scripts which primarily take advantage of the linux program pppd and chat to dial the ISP.


Pre-requisites:

1) Linux

2) pppd, bind-utils(dig/host), modem-manager

3) USB 3G or 4G modem e.g. Huawei e173, e3131, e160 or e220

4) Modem should be detected by linux i.e. usb_modeswitch


Usage:

1) Copy the pppd-ug directory in your home directory


2) run program (as root user):

sudo $HOME/dial-script.sh [ISP] [username] [password] [connection type]

For example:
sudo HOME/dial-script ORANGE username password 1

ISP Names
--------- 
UTL ORANGE MTN AIRTEL SMART VODAFONE

Username/Password
-----------------
These don't matter for most providers. So use 'username password'
 
Network Types
-------------
1 - 3G/WCDMA Only
2 - 2G/GPRS Only
3 - 3G/WCDMA Preferred
4 - 2G/GPRS Preferred


3) To terminate connection:

sudo killall pppd


Contribution:

This is a work in progress, so contributions/BUGs are very much welcome


Enjoy!
