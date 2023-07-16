FROM alpine
RUN apk upgrade && \
 apk add nginx && \
 apk add openrc && \
 apk add curl 
RUN adduser -D -g "nginx" www 
RUN mkdir -p /tmp/nginx/client-body 
RUN mkdir  /usr/share/nginx/html && \
mkdir /run/openrc/ && \
touch /run/openrc/softlevel
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
