FROM ubuntu:15.10
MAINTAINER niquola

RUN apt-get update && apt-get install -y openssh-server python-apt

RUN mkdir /root/.ssh
ADD secure/id_rsa.pub /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
ENV vhelper vault-ssh-helper_0.1.1_linux_amd64.zip
RUN apt-get install -y unzip
RUN cd /tmp && wget https://releases.hashicorp.com/vault-ssh-helper/0.1.1/$vhelper && unzip $vhelper
RUN cd /tmp && mv vault-ssh-helper /usr/local/bin/valut-ssh-helper

ADD config.hcl /etc/vault-ssh-helper.hcl
ADD sshd /tmp/sshd
RUN cat /tmp/sshd >> /etc/pam.d/sshd

ADD sshd_conf /tmp/sshd_conf
RUN cat /tmp/sshd_conf >> /etc/ssh/sshd_config

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]