#!/bin/bash
ZMPROV="/opt/zimbra/bin/zmprov"
date > tempo_criar_lista.txt
PATCH=/mnt/backup/WEBMAIL/listas

for LISTA in $(cat $PATCH/distlist.tmp); do

	#Criar listas
  $ZMPROV cdl "$LISTA"


	for CONTA in $(cat  $PATCH/"$LISTA");do
	     #adcionar conta na lista
    	 $ZMPROV  adlm  "$LISTA" "$CONTA"
  done
done

date >> tempo_criar_lista.txt
