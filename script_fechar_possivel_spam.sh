#!/bin/bash
#jeferson Araujo de Sousa
cat /var/log/mail.log| grep "sasl_method=PLAIN" | cut -d: -f5 | sort | uniq -c | sort -n > spam

  #pega quantidade por ip
  QTD=$(cat spam | grep client | awk -F " " '{print $1}')
  IP = $(cat spam |   awk -F "[" '{print $1"="$2}' | awk -F "]" '{print $1"="$2}'   | cut -d "=" -f3)
  CONTA = $(awk -F "[" '{print $1"="$2}' | awk -F "]" '{print $1"="$2}'   | cut -d "=" -f6)

  echo "$qtd|$ip|$conta" >> /tmp/temp
