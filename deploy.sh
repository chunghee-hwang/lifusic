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
cp account-local.yml ../lifusic-account-server/src/main/resources/application-local.yml
cp jasyptPrivateKey.txt ../lifusic-account-server/src/main/resources

cp core-dev.yml ../lifusic-core-server/src/main/resources/application-dev.yml
cp core-local.yml ../lifusic-core-server/src/main/resources/application-local.yml
cp jasyptPrivateKey.txt ../lifusic-core-server/src/main/resources

cp file-dev.yml ../lifusic-file-server/src/main/resources/application-dev.yml
cp file-local.yml ../lifusic-file-server/src/main/resources/application-local.yml
cp jasyptPrivateKey.txt ../lifusic-file-server/src/main/resources

cd ..
docker-compose down
docker rmi lifusic*
docker-compose -f docker-compose.yml up -d