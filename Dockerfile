FROM httpd
EXPOSE 80
RUN apt update
RUN apt install ssh wget -y
RUN mkdir /var/run/sshd 
RUN echo 'httpd-foreground &' >/1.sh
RUN echo '/usr/sbin/sshd -D&' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN wget https://getfrp.sh/d/frpc_linux_amd64
RUN chmod 755 frpc_linux_amd64
RUN mv frpc_linux_amd64 /bin
RUN echo 'frpc_linux_amd64  -f bozwj6ujyetaqawj4wps9wsaucdry1h9:1943747 ' >>/1.sh
RUN chmod 755 /1.sh
CMD  /1.sh
