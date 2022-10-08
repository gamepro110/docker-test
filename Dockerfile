# make a new container based off nginx on version 1.23
FROM nginx:1.23

# copy build book to docker html directory
COPY book/ /usr/share/nginx/html/

# copy nginx config from local config directory to container /etc/nginx directory
COPY config/* /etc/nginx/

# exposes port 80 from the container to the outside
EXPOSE 80
