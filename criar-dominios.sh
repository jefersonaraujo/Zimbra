#!/bin/bash
ZMPROV="/opt/zimbra/bin/zmprov cd"
date > tempo_criar-dominio.txt

#a partir de um lista, o scripr faz um loop e cria os dominos
for DOMINIO in $(cat /tmp/dominios.txt); do

	#Criar dominio listado em alguma lista
    $ZMPROV "$DOMINIO"
	 echo "Dominio " $DOMINIO " Criado " >>  criar_domino.log

done
date >> tempo_criar-dominio.txt
