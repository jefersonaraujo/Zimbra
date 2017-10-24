#!/bin/bash
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "
#onde estarao os dados para imprtação
CAM="/opt/contas"
date > tempo_importa-dados.txt

for DADOS in $(cat $CAM/contas.txt); do

  EMAIL=$(grep Conta $CAM/$DADOS/dados-$DADOS | awk -F " " '{print $2}')

	#Importa as caixas
	$ZMMAILBOX  "$EMAIL"  postRestURL "//?fmt=tgz&resolve=reset" 	$CAM/"$EMAIL"/"$EMAIL".tgz

	#importa filtros
	$ZMMAILBOX  "$EMAIL" < $CAM/"$EMAIL"/filter-"$EMAIL".txt

  #importa assinatura
	ASS="$(cat /opt/contas/$EMAIL/ass-$EMAIL  | grep -v ^# | grep -v zimbraSignatureId 	| grep -v   zimbraSignatureName | sed s/zimbraPrefMailSignatureHTML:/""/)"

	$ZMPROV csig "$EMAIL" ass  zimbraPrefMailSignatureHTML "$ASS"

	echo "Importando mgs " $EMAIL >> importMessages.log

 done
date >> tempo_importa-dados.txt
