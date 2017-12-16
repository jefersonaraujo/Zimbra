#!/bin/bash
# Cria as contas no Zimbra
#Autor : Jeferson Araujo
#e-mail : jefersonaraujo95@gmail.com

ZMPROV="/opt/zimbra/bin/zmprov"

for $MAIL  in $(ls ALIAS/); do
  for $ALIAS in $(cat ALIAS/$MAIL);do
      $ZMPROV aaa $MAIL $ALIAS
  done
done
