# alpine-infra
NTP(Chrony) and DHCP built with alpine

Run container as below:

```
docker run -it --privileged -p 123:123/udp -p 67:67/udp -v /etc/chrony/chrony.conf:/etc/chrony/chrony.conf -v /etc/dhcp/dhcpd.conf:/etc/dhcp/dhcpd.conf --name infra alpine-infra:latest
```
