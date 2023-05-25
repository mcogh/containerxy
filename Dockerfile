FROM node:latest
EXPOSE 3000
WORKDIR /app
COPY files/* /app/

RUN apt-get update &&\
    apt-get install -y iproute2 &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    wget -O cloudflared.deb https://github.com/mcogh/agy/releases/latest/download/cloudflared.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb &&\
    chmod +x web.js

ENTRYPOINT [ "node", "server.js" ]
