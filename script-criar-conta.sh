#!/bin/bash
# Cria as contas no Zimbra
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "
CAM="/mnt/backup"
date > criar-contas.txt
for DADOS in $(cat $CAM/contas.txt); do

  EMAIL=$(grep Conta $CAM/$DADOS/dados-$DADOS | awk -F " " '{print $2}')
  DNAME=$(grep Display $CAM/$DADOS/dados-$DADOS | awk -F " " '{print $2" 		"$3" "$4" "$5}')
  PNAME=$(grep Nome $CAM/$DADOS/dados-$DADOS | awk -F " " '{print $2}')
  SNAME=$(grep Sobrenome $CAM/$DADOS/dados-$DADOS | awk -F " " '{print 	$2}')
  SENHA=$(grep Senha $CAM/$DADOS/dados-$DADOS | awk -F " " '{print $2}')
  QOUTA=$(grep Qouta $CAM/$DADOS/dados-$DADOS | awk -F " " '{print $2}')

#Criar Conta primeiro e gera hash aleartoria
  $ZMPROV ca "$DADOS" password displayName "$DNAME" givenName "$PNAME" sn "$SNAME"

#modifica a hash, pela a exportada do servidor de produção.
  $ZMPROV ma  "$DADOS" userPassword "$SENHA" zimbraMailQuota "$QOUTA"

 done
date >> criar-contas.txt
