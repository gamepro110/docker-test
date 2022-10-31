# make a new container based off nginx on version 1.23
FROM nginx:1.23

# copy build book to docker html directory
#COPY book/ /usr/share/nginx/html/
# mounting local dir as volume in docker is not possible here!! placed in docker-compose.yml

# copy nginx config from local config directory to container /etc/nginx directory
COPY nginx-config/* /etc/nginx/
<<<<<<< HEAD
=======

# copy config files to the correct locations
COPY private-config/etc_nginx_dhparam.pem /etc/nginx/dhparam.pem
COPY private-config/etc_ssl_certs_ngingx-selfsigned.crt /etc/ssl/certs/ngingx-selfsigned.crt
COPY private-config/etc_ssl_private_nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
>>>>>>> e9b7840 (replaced copy instruction with volume assignment)

# exposes port 80 from the container to the outside
EXPOSE 80 443
