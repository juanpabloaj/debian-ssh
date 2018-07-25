FROM debian:jessie

RUN apt-get update -y &&\
    apt-get install -y openssh-server vim

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd

RUN echo 'root:root' |chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
