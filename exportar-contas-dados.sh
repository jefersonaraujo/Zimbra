#!/bin/bash
# Obtemos uma lista de todas as contas do servidor
ZMPROV="/opt/zimbra/bin/zmprov"
ZMMAILBOX="/opt/zimbra/bin/zmmailbox -z -m "
CAM="/mnt/novo_email/contas"    #caminho para onde será exportado os dados
date > tempo_obter-contas.txt

#lista todas contas do domino desejado. use "-v" para exerção.
#|grep -v "galsync"|grep -v "ham." | grep -v "virus-quarantine" |grep -v "spam." |grep -v "admin@"
for MAIL in $($ZMPROV -l gaa |grep "dominio.com.br"| sort);  do


							 DNOME=$($ZMPROV -l ga $MAIL displayName | grep displayName | awk -F " " '{print $2" "$3" "$4" "$5}')
               PNOME=$($ZMPROV -l ga $MAIL givenName | grep givenName | awk -F " " '{print $2}')
               SNOME=$($ZMPROV -l ga $MAIL sn | grep sn | awk -F " " '{print $2}')
               SENHA=$($ZMPROV -l ga $MAIL userPassword | grep userPassword | awk -F " " '{print $2}')
							 QUOTA=$($ZMPROV ga $MAIL | grep "zimbraMailQuota" | cut -d ":" -f2)


 								#criar pasta para cada e-mail para jogar informações especificas
	 							mkdir -p $CAM/$MAIL

								echo "Conta: $MAIL" > $CAM/$MAIL/dados-$MAIL
                echo "Display: $DNOME" >> $CAM/$MAIL/dados-$MAIL
                echo "Nome: $PNOME" >> $CAM/$MAIL/dados-$MAIL
                echo "Sobrenome: $SNOME" >> $CAM/$MAIL/dados-$MAIL
                echo "Senha: $SENHA" >> $CAM/$MAIL/dados-$MAIL
								echo "Qouta: $QUOTA" >> $CAM/$MAIL/dados-$MAIL


								#exportar os arquivos da conta
	 							$ZMMAILBOX  $MAIL getRestURL "//?fmt=tgz" >   $CAM/$MAIL/$MAIL.tgz

							 #Linha Abaixo obtem filter
	 						 $ZMMAILBOX  $MAIL gfrl >  $CAM/$MAIL/filter-$MAIL.txt
							 sed -i 's/^/afrl /' $CAM/$MAIL/filter-$MAIL.txt

								#Assinatura aqui exportar a Assinatura em format html
								$ZMPROV   gsig $MAIL  >  $CAM/$MAIL/ass-$MAIL
								echo $MAIL  >> $CAM/contas.txt





done

date >> tempo_obter-contas.txt
