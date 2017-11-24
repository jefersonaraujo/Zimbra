#!/bin/bash
for i in $(/opt/zimbra/bin/zmprov -l gaa)
do
    email=$(/opt/zimbra/bin/zmprov -l ga $i name | cut -d" " -f3)
    name=$(/opt/zimbra/bin/zmprov -l ga $i displayName | grep displayName | cut -d":" -f2|sed s,'^\ ',,g)
    echo -e "${name};${email}" >> /tmp/lista-full-contas.csv
done
