docker container prune
docker volume prune
docker rmi *lifusic*
docker-compose -f docker-compose-production-with-image.yml down
docker-compose -f docker-compose-production-with-image.yml up -d
docker rmi $(docker images -f "dangling=true" -q)