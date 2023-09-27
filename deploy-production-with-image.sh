docker container prune
docker-compose -f docker-compose-production-with-image.yml down
docker rmi *lifusic*
docker-compose -f docker-compose-production-with-image.yml up -d