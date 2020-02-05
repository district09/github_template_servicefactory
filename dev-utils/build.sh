#!/bin/bash
#####
#
# Build all docker images we need for testing the service, this included all of its dependencies
#
# Usage: 
#   ./build.sh - build images and start dockers
#   ./build.sh skip-start - just build, do not start dockers from local repo
#   ./build.sh skip-build - dont build, just start dockers from local repo
#
####

set -e

finish(){
  # Stop dockers
  docker-compose down

  # Cleanup old docker images
  docker rmi $(docker images -f 'dangling=true' -q)
}
trap finish EXIT

echo "Cleaning up previous run"
docker-compose down || true
echo ""

if [ "$1" != "skip-build" ]; then
  export PATH=$PATH:/usr/local/bin
  echo "Building docker images from source"
  echo ""
  echo "API"
  s2i build ../. registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift sms-api -e 'ARTIFACT_DIR=api/target'
  echo "API docker image built succesfully"
  echo ""
  echo "Worker"
  s2i build ../. registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift sms-worker -e 'ARTIFACT_DIR=worker/target'
  echo "Worker built succesfully"
  echo ""
  echo "Database"
  pushd dockers/sqlserver
  ./build.sh
  popd
fi

if [ "$1" != "skip-start" ]; then
  echo "Starting service"
  docker-compose up
fi
