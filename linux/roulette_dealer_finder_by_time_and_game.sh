#! /bin/bash

grep $1 /home/sysadmin/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Dealer_Analysis/$3*4* | grep $2 | awk '{print $1,$2,$5,$6}'

