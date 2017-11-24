#!/bin/bash
#jeferson Araujo de Sousa
max=$(wc -l spam | cut -d " " -f1)
SPAM=$(cat spam)
#cat /var/log/mail.log| grep "sasl_method=PLAIN" | cut -d: -f5 | sort | uniq -c | sort -n > spam
  for i in `seq 1 $max` ; do
    #pega quantidade por ip
    tail -$i $SPAM | grep client | awk -F " " '{print $1}' &> /tmp/qtd
    QTD=$(cat /tmp/qtd )
    tail -$i $SPAM |   awk -F "[" '{print $1"="$2}' | awk -F "]" '{print $1"="$2}'   | cut -d "=" -f3 &> /tmp/ip
    IP=$(cat /tmp/ip)
    tail -$i $SPAM |awk -F "[" '{print $1"="$2}' | awk -F "]" '{print $1"="$2}'   | cut -d "=" -f6 &> /tmp/conta
    CONTA=$(cat /tmp/conta)
    echo "$QTD|$IP|$CONTA" &> /tmp/temp

  done
