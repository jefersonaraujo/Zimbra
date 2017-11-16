#!/bin/bash




for linha in $(cat /opt/contas/alias.txt); do

 MAIL=$($linha	grep zimbraMailAlias | awk -F " " '{print $1}')
 ALIAS=$($linha	grep zimbraMailAlias | awk -F " " '{print $3}')


 /opt/zimbra/bin/zmprov cad $ALIAS $MAIL


done






