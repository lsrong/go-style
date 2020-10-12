FROM nginx:latest

LABEL Maintainer="Lsrong <lsrong0414@gmail.com>"

COPY _book /usr/share/nginx/html

EXPOSE 80