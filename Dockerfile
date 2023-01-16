# make a new container based off nginx on version 1.23
FROM nginx:1.23

# copy build book to docker html directory
COPY book/ /usr/share/nginx/html/

# copy nginx config from local config directory to container /etc/nginx directory
COPY config/* /etc/nginx/

# copy config files to the correct locations
COPY private-config/etc_nginx_dhparam.pem /etc/nginx/dhparam.pem
COPY private-config/etc_ssl_certs_ngingx-selfsigned.crt /etc/ssl/certs/ngingx-selfsigned.crt
COPY private-config/etc_ssl_private_nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key

# exposes port 80 from the container to the outside
EXPOSE 80
EXPOSE 443
