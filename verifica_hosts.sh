#!/bin/bash
verifica_ip(){
    local nume=$1
    local ip=$2
    local dns=$3
    local ip_nou

    ip_nou=$(nslookup $nume $dns | grep Address | tail -1 | awk '{print $2}')
    if [ "$ip" != "$ip_nou" ]
    then
        echo "Bogus IP for $nume in /etc/hosts!"
    fi
}

dns=$1

cat /etc/hosts | while read ip nume
do
    verifica_ip $nume $ip $dns
done
