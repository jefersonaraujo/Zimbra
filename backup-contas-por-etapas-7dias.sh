#!/bin/bash
# Obtemos uma lista de todas as contas do servidor
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "
CAM="/mnt/backup"    #caminho para onde será exportado os dados
HARI=`date --date='7 days ago' +"%m/%d/%Y"`
date2=`date +%m/%d/%Y`
query="&query=after:$HARI"
date > tempo_obter-contas.txt
max=100


for i in `seq 1 $max`; do


                MAIL=$(cat bkp-contas.txt | head -n $i | tail -n 1)

                #exportar os arquivos da conta
                $ZMMAILBOX  $MAIL getRestURL "//?fmt=tgz" >   $CAM/$MAIL/$MAIL.$HARI-$date2.tgz
                echo $MAIL >> exports-conta.log;

done

date >> tempo_obter-contas.txt
