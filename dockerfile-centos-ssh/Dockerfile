# Adrian Ramos <github.com/aramcap>

FROM centos:7
ENV container docker

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd sudo; yum clean all
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
EXPOSE 22

ARG SSH_USERS="root|root"
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh
RUN ./start.sh ${SSH_USERS}

ENTRYPOINT ["/usr/sbin/sshd", "-D"]