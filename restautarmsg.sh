#!/bin/bash
# Cria as contas no Zimbra
CAM=/mnt/BACKUP/zimbra/store/0/
for EMAIL in $(cat /opt/contas/contas.txt); do

	for I in $(cat /opt/contas/id.txt); do
	
	
	/opt/zimbra/bin/zmmailbox -z -m $EMAIL addMessage /inbox /$CAM/$I/msg/bkp/*.msg
	echo "Restaurando  $MAIL" >> /opt/contas/restauração.log
	
	done
done




