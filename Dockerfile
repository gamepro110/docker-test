FROM nginx:1.23

# copy build book to docker html dir
COPY book/ /usr/share/nginx/html/

# copy nginx config from local config directory to container /etc/nginx directory
COPY config/* /etc/nginx/

EXPOSE 80
