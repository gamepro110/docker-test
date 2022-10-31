# make a new container based off nginx on version 1.23
FROM nginx:1.23

# copy build book to docker html directory
#COPY book/ /usr/share/nginx/html/
# mounting local dir as volume in docker is not possible here!! placed in docker-compose.yml

# copy nginx config from local config directory to container /etc/nginx directory
COPY nginx-config/* /etc/nginx/

# exposes port 80 from the container to the outside
EXPOSE 80
EXPOSE 443
