#!/bin/bash

date > tempo_sicroniza-mensagens.txt
for USER in $(cat contas.txt); do

imapsync  --addheader --nosyncacls --nosyncacls --host1 "IP DO SERVIDOR DE PRODUCAO" --host2 "IP DO NOVO SERVIDOR" --authmech1 PLAIN --authmech2 PLAIN --ssl1 --user1 $USER --authuser1 "COLOCAR AQUI SEM ASPAS O E-MAIL DE ADM DO SERVIDOR DE PRODUCAO" --password1 "SENHA DO E-MAIL DO SERVIDOR DE PRODUCCAO" --ssl2 --user2 $USER --authuser2 "COLOCAR AQUI SEM ASPAS O E-MAIL DO NOVO SERVIDOR DE PRODUCAO ADM" --password2 "SENHA DA CONTA DO NOVO SERVIDOR"

echo "sicronizado mensagem " $USER >> sicronizando_msg.log

done
date >> tempo_sicroniza-mensagens.txt
