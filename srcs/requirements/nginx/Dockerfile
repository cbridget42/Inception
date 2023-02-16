FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
CMD nginx