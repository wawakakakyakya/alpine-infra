FROM alp-edge:latest

# install package
RUN apk update
RUN apk --no-cache add chrony dhcp supervisor \
    && rc-update add chronyd \
    && rc-update add dhcpd

# clean apk cache
RUN rm -rf /var/cache/apk/*

COPY chrony.conf /etc/chrony/chrony.conf
COPY dhcpd.conf /etc/dhcpd.conf

RUN touch /var/lib/dhcp/dhcpd.leases

# supervisor登録
# RUN touch /etc/supervisord.conf
# RUN echo '[supervisord]'  >> /etc/supervisord.conf
# RUN echo 'nodaemon=true'  >> /etc/supervisord.conf
# RUN echo '[program:chronyd]' >> /etc/supervisord.conf
# RUN echo 'command=rc-service chronyd' >> /etc/supervisord.conf
# RUN echo '[program:dhcpd]' >> /etc/supervisord.conf
# RUN echo 'command=rc-service dhcpd'   >> /etc/supervisord.conf

EXPOSE 67/udp 123/udp 323/udp

CMD ["/sbin/init"]

# supervisor 起動
# CMD ["/usr/bin/supervisord"]
