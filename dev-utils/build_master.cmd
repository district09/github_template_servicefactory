REM #####
REM #
REM # Build all docker images we need for testing the service, this included all of its dependencies
REM #
REM # Usage: 
REM #   ./build.sh - build images and start dockers
REM #   ./build.sh skip-start - just build, do not start dockers from local repo
REM #   ./build.sh skip-build - dont build, just start dockers from local repo
REM #
REM ####

@echo off

echo "Cleaning up previous run"
docker-compose down || true
echo .

IF /I NOT "%1" == "skip-build" (
  echo "Building docker images from source"
  echo ""
  echo "$COMPONENT_NAME"
  s2i build $GIT_REPO_REF -r $GIT_BRANCH $REDHAT_BASE_IMAGE $COMPONENT_NAME -e ARTIFACT_DIR=$PATH_TO_ARTIFACT_DIR
  echo "$COMPONENT_NAME docker image built succesfully"
  echo ""
  echo "$COMPONENT2_NAME"
  s2i build $GIT_REPO_REF -r $GIT_BRANCH $REDHAT_BASE_IMAGE $COMPONENT_NAME -e ARTIFACT_DIR=$PATH_TO_ARTIFACT_DIR
  echo "$COMPONENT2_NAME built succesfully"
  echo ""
  echo "Database"
  cd dockers/mssql
  call build.cmd
  cd ../..
  echo ""
  echo "Message Broker"
  cd dockers/amq
  call build.cmd
  cd ../..
  echo ""
)

IF /I NOT "%1" == "skip-start" (
  echo "Starting service"
  docker-compose up
)

echo Stopping dockers
docker-compose down

echo Cleanup old docker images 
docker rmi $(docker images -f 'dangling=true' -q)