FROM ubuntu:15.10
MAINTAINER niquola

RUN apt-get update && apt-get install -y openssh-server python-apt

RUN mkdir /root/.ssh
ADD secure/id_rsa.pub /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
