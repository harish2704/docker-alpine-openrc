from alpine:3.8

RUN apk update \
 && apk add openrc dropbear \
 && rc-update add dropbear \
 # php5-apache2 postgresql\ \
 # && rc-update add apache2 && rc-update add postgresql \
 && sed -ie 's/#rc_sys.*/rc_sys="prefix"/' /etc/rc.conf

 CMD /sbin/openrc-init
 
 VOLUME /var/log/apache2
 VOLUME /var/www/localhost

 LABEL org.label-schema.name="alpine" \
       maintainer="harish2704@gmail.com" \
       org.label-schema.description="A simple Alpine image with openrc & ssh. Optionally uncomment necessary lines for apache php postgres server" \
       org.label-schema.version="0.1" \
       org.label-schema.license="MIT"
