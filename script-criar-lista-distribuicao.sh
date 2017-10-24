#!/bin/bash
ZMPROV="/opt/zimbra/bin/zmprov"
date > tempo_criar_lista.txt

for LISTA in $(cat /tmp/listas/ld/distlist.tmp); do

	#Criar listas
  $ZMPROV cdl "$LISTA"

  
	for CONTA in $(cat /tmp/listas/"$LISTA");do
	     #adcionar conta na lista
    	 $ZMPROV  adlm  "$LISTA" "$CONTA"
  done
done

date >> tempo_criar_lista.txt
