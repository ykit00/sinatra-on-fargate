FROM nginx:latest

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/web.conf /etc/nginx/conf.d/web.conf

RUN rm /etc/nginx/conf.d/default.conf

EXPOSE 80
