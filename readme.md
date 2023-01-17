# docker-test

## plan

- [x] make a simple docker contianer based off nginx that uses the generated output from mdbook
  - [x] generate output with mdbook
  - [x] learn dockerfile syntax
  - [x] make custom dockerfile
    - [x] learn syntax
- [x] document findings
  - [x] what does each "command" in a docker file do
  - [x] write out how a docker container is layedout using a flowchart
- [x] rework dockerfile with new learnings
  - [x] share output from mdbook with container in read-only volume
    - this allows you to keep the container running while updating the website
- [x] write compose file
  - [x] add local dockerfile to the compose file
  - [x] add portainer to manage the containers
  - [x] deploy compose file on mv

## todo

- [/] work out documentation
- [x] change copy instruction to a read-only volume: ./book/ -> /var/www/html/

## commands used

- install the rust language (required by mdbook)
  - >`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- adding "rust" to path
  - >`source "$HOME/.cargo/env"`
- initialize mdbook project
  - >`mdbook init`

### usefull commands

- `mdbook build`
  - generate output based on the provided markdown files
- `mdbook watch`
  - updates the book build when it notices a file change
- `mdbook serve`
  - same as `mdbook watch` while serving it on `http://localhost:3000/`
- `mdbook clean`
  - deletes the build output

### required dependencies

- build-essentials (on debian-based linux systems)
  - gcc (for compiling rust)

## docs source

- <https://youtu.be/gAkwW2tuIqE>
- <https://hub.docker.com/_/nginx>
- <https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/>
