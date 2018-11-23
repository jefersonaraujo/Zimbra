#!/bin/bash
# FABIO S. SCHMIDT - fabio@respirandolinux.com.br
# 12/03/2017
# Script para procurar todas as mensagens com o assunto (subject) informado e deletar
# Limitacao: Expressao regular, qualquer assunto contendo a palavra sera considerado

#FUNCOES E VARIAVEIS PARA O UTILITARIO
NORMAL_TEXT="printf \e[1;34m%-6s\e[m\n" #Azul
ERROR_TEXT="printf \e[1;31m%s\e[0m\n" #Vermelho
INFO_TEXT="printf \e[1;33m%s\e[0m\n" #Amarelo
CHOICE_TEXT="printf \e[1;32m%s\e[0m\n" #Verde
NO_COLOUR="\e[0m" #Branco

#FUNCAO PARA CONFIRMAR A EXCLUSAO DAS MENSAGENS ENCONTRADAS
test_exec()
{

   read -p  "As seguintes mensagens foram encontradas, DESEJA CONTINUAR E EXCLUIR (sim/nao)?" choice
   case "$choice" in
   y|Y|yes|s|S|sim ) $NORMAL_TEXT "Iniciando exclusao das mensagens";;
   n|N|no|nao ) $INFO_TEXT "Execucacao abortada pelo usuario"
                exit 0;;
   * ) test_exec ;;
   esac
}


###

    if [ "$#" != 2 ]
     then
     $ERROR_TEXT "Utilizacao: $0 conta@dominio.com.br \"assunto\""
     $ERROR_TEXT "Atencao: Por limitacao do zmmailbox, somente 1000 resultados sao retornados por consulta"
     exit 1
    fi

####

    $INFO_TEXT "Procurando mensagens com o assunto $2 na caixa postal $1"
    $INFO_TEXT "Atencao: Por limitacao do zmmailbox, somente 1000 resultados sao retornados por consulta"
    /opt/zimbra/bin/zmmailbox -z -m "$1" s -l 1000 -t message "subject:$2"|awk '{ if (NR!=1) {print}}' | grep -v -e Id -e "-" -e "^$"
     #Executa funcao para confirmar a exclusao das mensagens encontradas
      test_exec
    
    for ITEM in `/opt/zimbra/bin/zmmailbox -z -m "$1" s -l 1000 -t message "subject:$2"|awk '{ if (NR!=1) {print}}' | grep -v -e Id -e "-" -e "^$" | awk '{ print $2 }'`
     do
     echo "Excluindo mensagem $ITEM da caixa postal $1"
     /opt/zimbra/bin/zmmailbox -v -z -m $1 dm $ITEM
     done


#FIM
