FROM alqutami/rtmp-hls:latest-alpine

COPY ./config/nginx_custom.conf /etc/nginx/nginx.conf
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
