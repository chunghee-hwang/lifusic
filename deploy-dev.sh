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

cp account-dev.yml ../lifusic-account-server/src/main/resources/application-dev.yml
cp jasyptPrivateKey.txt ../lifusic-account-server/src/main/resources

cp music-service-dev.yml ../lifusic-music-service-server/src/main/resources/application-dev.yml
cp jasyptPrivateKey.txt ../lifusic-music-service-server/src/main/resources

cp file-dev.yml ../lifusic-file-server/src/main/resources/application-dev.yml
cp jasyptPrivateKey.txt ../lifusic-file-server/src/main/resources

cp gateway-dev.yml ../lifusic-gateway/src/main/resources/application-dev.yml
cp jasyptPrivateKey.txt ../lifusic-gateway-server/src/main/resources

cp .env.dev ../lifusic-frontend/.env

cd ..
docker container prune
docker volume prune
docker rmi -f *lifusic*
docker-compose -f docker-compose-dev.yml down
docker-compose -f docker-compose-dev.yml up -d
docker rmi $(docker images -f "dangling=true" -q)