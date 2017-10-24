#!/bin/bash
date > tempo_gerar_lista.txt
ZMPROV="/opt/zimbra/bin/zmprov"
mkdir -p /tmp/listas/ld/

#Joga o nome de todas listas de distribuição em arquivo
$ZMPROV gadl >  /tmp/listas/ld/distlist.tmp
#Ler as listas no arquivo
for lista in `cat /tmp/listas/ld/distlist.tmp`; do

  #joga em arquivo as contats contidas na lista
  $ZMPROV gdl $lista |grep zimbraMailForwa |cut -d" " -f2 &> /tmp/listas/$lista;

done
date >> tempo_gerar_lista.txt
