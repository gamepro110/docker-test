# container layout

```mermaid
flowchart TB
  any(any pc)
  eth(ethernet)

  subgraph server_graph
    direction TB

    servKern(kernel)
    servOs(server os)
    virt([vertualize])

    subgraph vm_2
      direction TB
      vm2kernel(vm kernel)
      vm2os(vm os)

      vm2os --> vm2kernel 
    end
    
    subgraph vm_1
      direction TB

      dock(docker runner)
      vmIP(vm ip)
      
      subgraph docker_container
        dockOs(docker os)
        nginx(nginx webserver)
        site(website)
      end

      vm1os(vm os)
      vm1kernel(vm kernel)

      vm1os -- virtualize ---> dockOs
      dock -- forward --> dockOs
      dockOs -- runs --> nginx
    end

  end

  servOs -- uses --> servKern

  nginx -- expose port 80 ---> dock
  nginx -- serve --> site

  vm1os -- expose localhost:80 to network --> dock
  vmIP ---> dock

  eth -- forward --> vmIP

  dockOs -- uses ---> vm1kernel
  vm1os -- uses --> vm1kernel

  any -- request ---> eth

  servOs --- virt

  virt ---> vm_1
  virt ---> vm_2

```

## feedback

- where does the docker img come from ??
  - in this setup it comes from building it locally using a Dockerfile and docker-compose.yml
    - > ./Dockerfile
      >
      >```docker
      >FROM nginx:1.23
      >
      ># copy build book to docker html dir
      >COPY book/ /usr/share/nginx/html/
      >
      ># copy nginx config from local config directory to      >container /etc/nginx directory
      >COPY config/* /etc/nginx/
      >
      ># exposes port 80 from the container to the outside
      >EXPOSE 80
      >```
      >
      >---
    - > ./docker-compose.yml
      >
      >```yaml
      >version: "3"
      >services:
      >  website:
      >    build: . # uses the local Dockerfile to build a   container
      >    ports: # expose (device:container) port 5000:80
      >      - "5000:80"
      >    restart: unless-stopped # keeps the container   running until it is manually stopped
      >
      >```
      >
      >---
