### Stop container
 docker-compose stop $(docker ps -qf)

### To remove all containers that are NOT running
docker rm `docker ps -aq -f status=exited`

### To list all running and stopped containers

docker ps -a
### To list all running containers (just stating the obvious and also example use of -f filtering option)

docker ps -a -f status=running
### To list all running and stopped containers, showing only their container id

docker ps -aq

### List all name of all containers
docker inspect --format='{{.Name}}' $(sudo docker ps -aq --no-trunc)


# Remove all images pendente
docker rmi $(docker images -f dangling=true -q)


### One liner to stop / remove all of Docker containers:

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

##### Verificando se está funcionando api
curl -H 'Accept: application/vnd.marketplace.v1' http://api.market_place_api.dev/users/1