#!/bin/bash
# Cria as contas no Zimbra
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "

date > criar-contas.txt
for DADOS in $(cat /caminho/contas/contas.txt); do

  EMAIL=$(grep Conta /caminho/contas/$DADOS/dados-$DADOS | awk -F " " '{print $2}')
  DNAME=$(grep Display /caminho/contas/$DADOS/dados-$DADOS | awk -F " " '{print $2" 		"$3" "$4" "$5}')
  PNAME=$(grep Nome /caminho/contas/$DADOS/dados-$DADOS | awk -F " " '{print $2}')
  SNAME=$(grep Sobrenome /caminho/contas/$DADOS/dados-$DADOS | awk -F " " '{print 	$2}')
  SENHA=$(grep Senha /caminho/contas/$DADOS/dados-$DADOS | awk -F " " '{print $2}')
  QOUTA=$(grep Qouta /caminho/contas/$DADOS/dados-$DADOS | awk -F " " '{print $2}')

#Criar Conta primeiro e gera hash aleartoria
  $ZMPROV ca "$DADOS" password displayName "$DNAME" givenName "$PNAME" sn "$SNAME"

#modifica a hash, pela a exportada do servidor de produção. 
  $ZMPROV ma  "$DADOS" userPassword "$SENHA" zimbraMailQuota "$QOUTA"

 done
date >> criar-contas.txt
