#!/bin/bash
# Cria as contas no Zimbra
#Autor : Jeferson Araujo
#e-mail : jefersonaraujo95@gmail.com

for i in $(cat lista-all); do

   ALIAS=$(/opt/zimbra/bin/zmprov ga $i | grep MailAlias | cut -d " " -f2);
   if [ -n $TESTE ];then
   echo "vazio" >> ALIAS/$i/$ALIAS;

   fi


done
