for i in `cat /tmp/id-zimbra`; do

       `ls -lt /opt/zimbra/store/0/$i/msg/ |grep "Dez 1[1-3]" |cut -d ":" -f 2 |cut -d" " -f2 > /tmp/pasta-id-$i`

done
