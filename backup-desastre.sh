#!/bin/bash
# Cria as contas no Zimbra

for ID in $(ls /mnt/backup/id/); do

	for MSG in $(cat /mnt/backup/id/$ID); do
		mkdir -p /mnt/backup/MAIL/$ID
		cp -a /opt/zimbra/store/0/$ID/msg/$MSG /mnt/backup/MAIL
		echo "SICRONIZANDO MSG  $ID" >> /tmp/desatre.log

	done
done

for i in `cat /tmp/teste-id`; do
				`mkdir /mnt/backup/MAIL/$i`
        for j in `cat /mnt/backup/id/$i`; do
        `mkdir /mnt/backup/MAIL/$i/$j`
        `cp /opt/zimbra/store/0/$i/msg/$j/*/mnt/backup/MAIL/$i/$j`
        done
done
