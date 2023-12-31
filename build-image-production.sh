LOCALREPO=lifusic-config
REPOSRC=https://github.com/chunghee-hwang/lifusic-config.git

git submodule update --remote

if [ ! -d $LOCALREPO ]
then
    git clone $REPOSRC $LOCALREPO
else
    cd $LOCALREPO
    git pull $REPOSRC
fi

cp account-production.yml ../lifusic-account-server/src/main/resources/application-production.yml
cp jasyptPrivateKey.txt ../lifusic-account-server/src/main/resources

cp music-service-production.yml ../lifusic-music-service-server/src/main/resources/application-production.yml
cp jasyptPrivateKey.txt ../lifusic-music-service-server/src/main/resources

cp file-production.yml ../lifusic-file-server/src/main/resources/application-production.yml
cp jasyptPrivateKey.txt ../lifusic-file-server/src/main/resources

cp gateway-production.yml ../lifusic-gateway/src/main/resources/application-production.yml
cp jasyptPrivateKey.txt ../lifusic-gateway-server/src/main/resources

cp .env.production ../lifusic-frontend/.env

cd ..
docker container prune
docker volume prune
docker rmi -f *lifusic*
docker-compose -f docker-compose-production.yml down
docker-compose -f docker-compose-production.yml build
docker rmi $(docker images -f "dangling=true" -q)