#!/bin/sh
# source util.sh
# source not a thing in ubuntu dash :/
. ./util.sh
. ./dependencies.sh

checkDeps

git clone --quiet git@github.com:Coffee-Camel-Bazel-Boys/bff.git
git clone --quiet git@github.com:Coffee-Camel-Bazel-Boys/garden-land.git
git clone --quiet git@github.com:Coffee-Camel-Bazel-Boys/geoserver-setup.git
git clone --quiet git@github.com:Coffee-Camel-Bazel-Boys/frontend.git

printf "${INFO}Cloned repositories${CLEAR}\n"

(cd frontend; yarn install; yarn build --configuration=production)

docker-compose up

(cd geoserver-setup; bazelisk build image)

docker stop geo
docker container rm geo
docker image rm -f geoserver
docker load -i geoserver-setup/bazel-bin/geoserver/tarball.tar
docker run -itd --network=garden-land -p 6001:6001 --name geo geoserver

rm -rf bff
rm -rf frontend
rm -rf garden-land
rm -rf geoserver-setup

printf "${INFO}Done ${CLEAR}\n"