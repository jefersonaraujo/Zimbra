#!/bin/bash
# Cria as contas no Zimbra
#Autor : Jeferson Araujo
#e-mail : jefersonaraujo95@gmail.com

for i in $(cat lista-all); do
  ALIAS=$(/opt/zimbra/bin/zmprov ga $i | grep MailAlias |  awk '{print $2}');
  echo "$ALIAS" >> ALIAS/$i;

done

echo "REMOVENDO ARQUIVOS VAZIOS"
find ALIAS/ -type f -size 1c -exec rm {} \;
