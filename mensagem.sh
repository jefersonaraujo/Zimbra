#!/bin/bash
# Cria as contas no Zimbra

for EMAIL in $(cat /opt/contas/contas.txt); do 


	ID=$(/opt/zimbra/bin/zmprov gmi $EMAIL | grep mailboxId | awk -F " " '{print $2}')

	echo $ID >> /opt/contas/id.txt

	
done

