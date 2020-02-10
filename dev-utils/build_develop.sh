
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
  echo "$COMPONENT_NAME"
  s2i build $GIT_REPO_REF -r $GIT_BRANCH $REDHAT_BASE_IMAGE $COMPONENT_NAME -e ARTIFACT_DIR=$PATH_TO_ARTIFACT_DIR
  echo "API docker image built succesfully"
  echo ""
  echo "$COMPONENT2_NAME"
  s2i build $GIT_REPO_REF -r $GIT_BRANCH $REDHAT_BASE_IMAGE $COMPONENT2_NAME -e ARTIFACT_DIR=$PATH_TO_ARTIFACT_DIR
  echo "$COMPONENT2_NAME built succesfully"
  echo ""
  echo "Database"
  pushd dockers/mssql
  ./build.sh
  popd
  echo ""
  echo "Message Broker"
  pushd dockers/amq
  ./build.sh
  popd
  echo "AMQ"
  pushd ./dockers/amq/
  ./build.sh
  popd
fi

if [ "$1" != "skip-start" ]; then
  echo "Starting service"
  docker-compose up
fi
