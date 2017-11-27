#!/bin/bash
# Obtemos uma lista de todas as contas do servidor
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "
CAM="/mnt/backup"    #caminho para onde será exportado os dados
date > tempo_obter-contas.txt
max=100
#fazer backup por etapas para nao sobrecarregar o server
#No for trocar ponto inicail "1" a medida que irar fazer o backup. Exemplo se o servidor tem 500 contas, inicialmente sera de um até 'max' que define como 100, na segunda jogada será de 101 até 'max' que definirei como 200, e assim por diante.
for i in `seq 1 $max`; do


                MAIL=$(cat bkp-contas.txt | head -n $i | tail -n 1)

                #exportar os arquivos da conta
                $ZMMAILBOX  $MAIL getRestURL "//?fmt=tgz" >   $CAM/$MAIL/$MAIL.tgz
                echo $MAIL >> exports-conta.log;

done

date >> tempo_obter-contas.txt
