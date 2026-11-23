#!/bin/bash
cat /etc/hosts | while read ip nume
do
    ip_nou=$(nslookup $nume | grep Address | tail -1 | awk '{print $2}')
    if [ "$ip" != "$ip_nou" ]
    then
	echo "Bogus IP for $nume in /etc/hosts!"
    fi
done
