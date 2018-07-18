# Zimbra
Repositório de Scripts Zimbra Webmail
Nesse repositório terá scripts para ultilização no Zimbra, os scripts aqui listados já foram ultilizados em ambiente de produção, e migração de e-mails para outros servidores.


#### comando para entregar mensagens retidas devido a cota
zmprov mcf zimbraLmtpPermanentFailureWhenOverQuota TRUE

#### Criar uma conta
zmprov ca conta@dominio.com

#### Alterar um senha
zmprov sp conta@domino.com senha

#### Limpar uma pasta
zmprov sm user1@macpro.local emptyFoldefsr /contacts

#### Listar todas as pastas de um usuário
zmmailbox -z -m user@dominio.com.br gaf

#### Deletar uma pasta
zmmailbox -z -m marcelo@netsol.com.br df <pasta

#### Configurar o usuário como ADMIN
zmprov ma futur-admin@domain.com zimbraIsAdminAccount TRUE

#### Desbloquear conta
zmprov ma user@dominio zimbraAccountStatus active
zmprov ma rcarvalho@limnos.com.br zimbraAccountStatus active

#### Bloquear conta
zmprov ma user@dominio zimbraAccountStatus locked


#### Criar encaminhamento
zmprov ma a@example.com +zimbraMailForwardingAddress x@domain.com
 
#### Limpa todas as filas
/opt/zimbra/postfix/sbin/postsuper -d ALL deferred

#### Limpa fila de emails adiados
/opt/zimbra/postfix/sbin/postsuper -c  -d ALL deferred

#### Criar alias
zmprov aaa conta@dominio.com.br alias@dominio.com.br

#### Criar lista de distribuição
zmprov cdl lista@dominio.com.br

###


### Example of a 421 error:

421 4.7.0 [167.89.55.59 15] Our system has detected that this message is suspicious

due to the nature of the content and/or the links within. To best protect our users from spam,

the message has been blocked. Please visit https://support.google.com/mail/answer/188131

for more information. u22si16671234pfl.244 - gsmtp


