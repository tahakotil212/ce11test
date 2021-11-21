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

elif cat /etc/os-release | grep PRETTY_NAME | grep "jessie"; then
    # OS = Debian 8
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid3/passwd
    /bin/rm -f /etc/squid3/squid.conf
    /usr/bin/touch /etc/squid3/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/londonertech/createproxy/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    service squid3 restart
    update-rc.d squid3 defaults
    ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "stretch"; then
    # OS = Debian 9
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/londonertech/createproxy/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    systemctl enable squid
    systemctl restart squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "buster"; then
    # OS = Debian 10
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/londonertech/createproxy/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 3128 -j ACCEPT
    /sbin/iptables-save
    systemctl enable squid
    systemctl restart squid
else
    echo "OS NOT SUPPORTED.\n"
    echo "Contact admin@serverok.in to add support for your os."
    exit 1;
fi

#/usr/bin/htpasswd -b -c /etc/squid/passwd USERNAME_HERE PASSWORD_HERE
