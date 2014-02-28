FROM centos

RUN yum -y update
RUN yum -y install dnsmasq 

RUN printf 'address="/somehostname/127.0.0.1"\n' >> /etc/dnsmasq.d/0hosts

RUN printf 'listen-address=127.0.0.1\nresolv-file=/etc/resolv.dnsmasq.conf\nconf-dir=/etc/dnsmasq.d\nuser=root' >> /etc/dnsmasq.conf

RUN printf 'nameserver 8.8.8.8\nnameserver 8.8.4.4' >> /etc/resolv.dnsmasq.conf

RUN touch /etc/sysconfig/network
