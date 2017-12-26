#!/bin/bash
date > tempo_gerar_lista.txt
ZMPROV="/opt/zimbra/bin/zmprov"
PATCH=/tmp

mkdir -p $PATCH

$ZMPROV gadl > $PATCH/distlist.tmp
for lista in `cat $PATCH/distlist.tmp`; do

$ZMPROV gdl $lista |grep zimbraMailForwa |cut -d" " -f2 &> $PATCH/$lista;

done
date >> tempo_gerar_lista.txt
