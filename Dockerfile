FROM nginx:1.12

LABEL MAINTAINER C01-Group


# RUN apt-get update \
#    && apt-get install -y  iputils-ping \
#    && apt-get install -y  telnet \
#    && apt-get install -y  iproute2

RUN rm -f /var/log/nginx/access.log \
	&& rm -f /var/log/nginx/error.log

ADD confd-0.13.0-linux-amd64 /bin/confd
RUN chmod +x /bin/confd

COPY confd /etc/confd
# COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY docker_starter /start
RUN chmod +x /start

CMD ["/start"]
