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

