#!/bin/bash
# Obtemos uma lista de contatos de cada conta
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "


#Varre todas as contas e exporta a lista de contatos
for EMAIL  in $(cat /bin/util/contas.txt); do

  #Importar arquivo com os contatos

  $ZMMAILBOX $EMAIL pru /Contacts /tmp/contatos/$EMAIL.csv
  


done
