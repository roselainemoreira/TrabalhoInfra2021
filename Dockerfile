# define a imagem base
FROM debian:latest
# define o mantenedor da imagem
LABEL maintainer="Roselaine Moreira"
# Atualiza a imagem com os pacotes
RUN apt-get update && apt-get upgrade -y
# Instala o NGINX para testar
RUN apt-get install nginx -y
# Expoe a porta 80
EXPOSE 80
# Comando para iniciar o NGINX no Container
CMD ["nginx", "-g", "daemon off;"]

FROM roselaineinfra2021/trabalho_1_infra:1.0
 MAINTAINER Roselaine Moreira
 WORKDIR /usr/app
 COPY package.json ./
 RUN yarn install
 RUN cat package.json
 RUN apt-get update && apt-get install -y apache2 && apt-get clean
 ENV APACHE_LOCK_DIR=”/var/lock”
 ENV APACHE_PID_FILE=”/var/run/apache2.pid”
 ENV APACHE_RUN_USER=”www-data”
 ENV APACHE_RUN_GROUP=”www-data”
 ENV APACHE_LOG_DIR=”/var/log/apache2″ LABEL Description=”Trabalho_1_infra:1.0″
EXPOSE 3000
 ADD  ./index.html / var / www / html /

 RUN chown -R www-data: /var/www/html/.
 CMD yarn start
