# gtd-outlook-addin

## Deploy webapp locally (using docker and ngrok)

0. Setup environment 
> **Info:** Please update the `GTD_ENVIRONMENT` environment variable with the name of relevant folder in your config folder.
```sh
export GTD_ENVIRONMENT="dev"
chmod +x ./config/$GTD_ENVIRONMENT/env.sh
source ./config/$GTD_ENVIRONMENT/env.sh
```

1. Create docker network
```sh
docker network create $GTD_DOCKER_NETWORK
```

2. Start local server using docker.
```sh
docker run -d \
  --network $GTD_DOCKER_NETWORK \
  --name $GTD_CONTAINER_NAME \
  -v ./docs/:/usr/share/nginx/html \
  -p $GTD_PORT_NUMBER:80 \
  nginx:alpine
```
> **Info:** Use `docker logs $GTD_CONTAINER_NAME` for viewing logs.

3. Tunnel local server through ngrok.
```sh
docker run  -d \
  -e NGROK_AUTHTOKEN=$NGROK_AUTH_TOKEN \
  --network $GTD_DOCKER_NETWORK \
  --name $NGROK_CONTAINER_NAME \
  ngrok/ngrok:alpine \
  http --domain=$NGROK_DOMAIN $GTD_CONTAINER_NAME:80
```
> **Info:** Use `docker logs $NGROK_CONTAINER_NAME` for viewing logs.

## Install addin
1. Install addin by uploading manifest file.