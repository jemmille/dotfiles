#setup for root access
alias rinit="KRB5CCNAME=/tmp/krb-root kinit -f <user>/root"

#setup for normal user access (important for webpages etc.)
alias jinit="kinit -f <user>"

#gives me root
alias rssh="SSH_AUTH_SOCK='' KRB5CCNAME=/tmp/krb-root ssh -lroot -p7822"

#let me rcp with my root creds.
alias rscp='SSH_AUTH_SOCK='\'''\'' KRB5CCNAME=/tmp/krb-root scp -o '\''User root'\'''

#What tickets do I have as root?
alias rlist='klist -c /tmp/krb-root'

#Wipe out my root creds.
alias rdestroy='kdestroy -c /tmp/krb-root'

#gives me my normal user with no ssh agent
alias kssh="SSH_AUTH_SOCK='' KRB5CCNAME=/tmp/krb-<user> ssh -l<user> -p7822"

#uses no kerberos whatsoever
alias nkssh="SSH_AUTH_SOCK='' KRB5CCNAME='' ssh"

#Personal Aliases
alias wopr="ssh -p7822 <user>@wopr.<server>"
alias rwopr="rssh -p7822 wopr.<server>"
alias chrome="open -n -a /Applications/Google\ Chrome.app --args --auth-server-whitelist="*.<server>""
alias f="ssh -lroot ferret"
alias m="ssh -lroot mongrel"

#Extra Path Variables
PATH=/Users/jemmille/.gem/ruby/1.8/bin:$PATH
