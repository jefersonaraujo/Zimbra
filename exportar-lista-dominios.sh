#!/bin/bash
# Obtemos uma lista de todas os dominios
date > lista-dominios.txt
ZMPROV="/opt/zimbra/bin/zmprov"


#use "-v" para exerção de algum dominio. Ex : grep -v "dominioquenaoquerolistar.com.br"
for DOM in $($ZMPROV gad | sort);  do
      	echo $DOM >> /tmp/dominios.txt

done
date >> lista-dominios.txt
