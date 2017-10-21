# Docker image for Streama

Docker image for [Streama](https://github.com/dularion/streama)

# Getting started

* Choose a data directory (eg: /opt/dockerdata/streama/data )
* start `docker -d -v "/opt/dockerdata/streama/data:/data:rw" -p 8080:8080 gissehel/streama`
* Wait a bit for the server to listen
* Wait again because it's java powered
* Browse http://127.0.0.1:8080/ (or the ip of the remote server you're using) and enjoy. Login / Password of admin account is admin/admin, needless to say that it should be changed as soon as possible

# Security concerns

* If you're paranoid (and you should be), you should start the first time your server with the command line `docker -d -v "/opt/dockerdata/streama/data:/data:rw" -p 127.0.0.1:8080:8080 gissehel/streama` that will let you access the server only from 127.0.0.1, and use the other command once you've set a stronger password.
* If you don't trust all users of the host server you're launching streama on, the point above may not be enought

# Advanced usage : using web server proxy

* It is recommanded to use that docker image (as for any docker image providing a web server) threw an nginx (or an apache proxy if you insist on using last century's technology) to provide https and vhost handling
* One way to do that is to start a nginx/nginx image with the correct vhost configuration file to proxy this container
  * Pro : Pretty simple if you already know how to configure nginx
  * Con : Require knowledge with nginx
  * Con : Require some configuration each time a new container is added
* An other way is to use [nginx-proxy](https://github.com/jwilder/nginx-proxy)
  * Pro : Require very few configuration each time a new container is added (mainly adding the correct environnement variables to the container)
  * Con : Require to understand nginx-proxy infrastructure before starting playing with, so the learning curve is quite slower
* If you're using [nginx-proxy](https://github.com/jwilder/nginx-proxy) and want some free, [let's encrypt](https://letsencrypt.org/) based https certificates, go check [docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion) which is the perfect complement to nginx-proxy.
  * Pro : Just works
  * Con : None if you're already using nginx-proxy, it works the same way, and works with it.



