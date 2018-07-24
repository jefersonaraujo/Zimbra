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
501, “5.5.2”, Cannot Decode response.

502, “5.5.1”, Too many unrecognized commands, goodbye.

502, “5.5.1”, Unimplemented command.

502, “5.5.1”, Unrecognized command.

503, “5.5.1”, “EHLO/HELO first.

503, “5.5.1”, MAIL first.

503, “5.5.1”, RCPT first.

503, “5.7.0”, No identity changes permitted.

504, “5.7.4”, Unrecognized Authentication Type.

530, “5.5.1”, Authentication Required.

530, “5.7.0”, Must issue a STARTTLS command first.

535, “5.5.4”, Optional Argument not permitted for that AUTH mode.

535, “5.7.1”, Application-specific password required.

535, “5.7.1”, Please log in with your web browser and then try again.

535, “5.7.1”, Username and Password not accepted.

550, “5.1.1”, The email account that you tried to reach does not exist. Please try double-checking the recipient’s email address for typos or unnecessary spaces.

550, “5.2.1”, The email account that you tried to reach is disabled.

550, “5.2.1”, The user you are trying to contact is receiving mail at a rate that prevents additional messages from being delivered.

550, “5.4.5”, Daily sending quota exceeded.

550, “5.7.0”, Mail relay denied.

550, “5.7.0”, Mail Sending denied.

550, “5.7.1”, Email quota exceeded.

550, “5.7.1”, Invalid credentials for relay.

550, “5.7.1”, Our system has detected an unusual rate of unsolicited mail originating from your IP address.

550, “5.7.1”, Our system has detected that this message is likely unsolicited mail. To reduce the amount of spam sent to Gmail, this message has been blocked.

550, “5.7.1”, The IP you’re using to send mail is not authorized to send email directly to our servers. Please use the SMTP relay at your service provider instead.

550, “5.7.1”, The user or domain that you are sending to (or from) has a policy that prohibited the mail that you sent. Please contact your domain administrator for further details.

550, “5.7.1”, Unauthenticated email is not accepted from this domain.

552, “5.2.2”, The email account that you tried to reach is over quota.

552, “5.2.3”, Your message exceeded Google’s message size limits.

553, “5.1.2”, We weren’t able to find the recipient domain. Please check for any spelling errors, and make sure you didn’t enter any spaces, periods, or other punctuation after the recipient’s email address.

554, “5.6.0”, Mail message is malformed. Not accepted.

554, “5.6.0”, Message exceeded 50 hops, this may indicate a mail loop.

554, “5.7.0”, Too Many Unauthenticated commands.

555, “5.5.2”, Syntax error.


How to Request Removal from Gmail's Blacklist
The best way to get your IP out if the Google blacklist is by filling the form on this page: Report a delivery problem between your domain and Gmail

Once the form is submitted it takes 3-7 days for the process to take place. You may not hear back from Gmail, but your emails will start reaching Gmail users once you have fixed the issue you were blacklisted for.

In case you send legitimate bulk emails and get bounces with the 400 error code, then you need to go through the Google's Bulk Sender Guidelines and then complete the Bulk Sender Contact Form

Also, it is recommended that you sign up for a Google postmaster account and check your sending domain reputation with Google. You will get access to several dashboards: Spam Rate Dashboard, Domain and IP Reputation Dashboard, Feedback Loop Dashboard (only for senders who implemented the Gmail Spam Feedback Loop), Authentication Dashboard, Delivery Errors Dashboard.

And it is important that you stick to the best email marketing practices to make sure the IP does not get blacklisted in the first place.

http://www.anti-abuse.org/multi-rbl-check-results
