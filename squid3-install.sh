#!/bin/bash

if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/tahakotil212/ce11test/blob/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3129 -j ACCEPT
       /sbin/iptables -I INPUT -p tcp --dport 3130 -j ACCEPT
       /sbin/iptables -I INPUT -p tcp --dport 3131 -j ACCEPT
    /sbin/iptables -I INPUT -p tcp --dport 3132 -j ACCEPT
    /sbin/iptables -I INPUT -p tcp --dport 3133 -j ACCEPT
    /sbin/iptables -I INPUT -p tcp --dport 3134 -j ACCEPT
    /sbin/iptables -I INPUT -p tcp --dport 3135 -j ACCEPT
    service squid restart
    systemctl enable squid
else
    echo "Ubuntu 18.04 Destekler."
    echo "Contact admin@serverok.in to add support for your os."
    exit 1;
    fi
