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



## Google(gmail)
### Example of a 421 error:

421 4.7.0 [167.89.55.59 15] Our system has detected that this message is suspicious

due to the nature of the content and/or the links within. To best protect our users from spam,

the message has been blocked. Please visit https://support.google.com/mail/answer/188131

for more information. u22si16671234pfl.244 - gsmtp

### Example of a 550 error:

SMTP error from remote mail server after end of data:

host gmail-smtp-in.l.google.com [173.194.71.26]:

550-5.7.1 [194.XXX.XXX.181] Our system has detected an unusual rate of

550-5.7.1 unsolicited mail originating from your IP address. To protect our

550-5.7.1 users from spam, mail sent from your IP address has been blocked.

550-5.7.1 Please visit http://www.google.com/mail/help/bulk_mail.html to review

550 5.7.1 our Bulk Email Senders Guidelines. k8si8849879lbl.62

### Here's the full list of Gmail error codes:
421, “4.4.5”, Server busy, try again later.

421, “4.7.0”, IP not in whitelist for RCPT domain, closing connection.

421, “4.7.0”, Our system has detected an unusual rate of unsolicited mail originating from your IP address.

421, “4.7.0”, Temporary System Problem. Try again later.

421, “4.7.0”, TLS required for RCPT domain, closing connection.

421, “4.7.0”, Try again later, closing connection.

450, “4.2.1” The user you are trying to contact is receiving mail too quickly.

450, “4.2.1”, The user you are trying to contact is receiving mail at a rate that prevents additional messages from being delivered. Please resend your message at a later time. If the user is able to receive mail at that time, your message will be delivered.

451, “4.3.0”, Mail server temporarily rejected message.

451, “4.3.0”, Multiple destination domains per transaction is unsupported. Please try again.

451, “4.4.2”, Timeout – closing connection.

451, “4.5.0”, SMTP protocol violation, see RFC 2821.

452, “4.2.2”, The email account that you tried to reach is over quota.452, “4.5.3”, Domain policy size per transaction exceeded, please try this recipient in a separate transaction.

452, “4.5.3”, Your message has too many recipients.

454, “4.5.0”, SMTP protocol violation, no commands allowed to pipeline after STARTTLS, see RFC 3207.

454, “4.7.0”, Cannot authenticate due to temporary system problem.

454, “5.5.1”, STARTTLS may not be repeated.




