FROM alpine:3.16
RUN apk update && apk upgrade && apk add --no-cache nginx; \
echo 'daemon off;' >> /etc/nginx/nginx.conf
COPY conf/ /etc/nginx/http.d/
EXPOSE 443
CMD nginx