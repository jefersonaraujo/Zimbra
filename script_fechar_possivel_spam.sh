#!/bin/bash
#jeferson Araujo de Sousa
max=$(wc -l spam | cut -d " " -f1)
#spam=$(cat spam)
#cat /var/log/mail.log| grep "sasl_method=PLAIN" | cut -d: -f5 | sort | uniq -c | sort -n > spam
  for i in `seq 1 $max` ; do
    tail -$i spam |  awk -F "sasl_username=" '{print $1"="$2}'| awk -F "[" '{print $1"="$2}' | awk -F "]" '{print $1"="$2}'   |  awk -F " " '{print $0"="$1}' | cut -d "=" -f7,3,6 >> /tmp/temp


  done
