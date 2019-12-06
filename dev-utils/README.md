# Running Locally #

## Prerequisites ##

* [s2i](https://github.com/openshift/source-to-image)
* [docker](https://www.docker.com/)

## Environmental variables ##

Set up these envars in your local machine to make the application go. You can find all the neccesary envars [here](../README.md#environment-variables). 

## Build and run ##

We provide 3 scripts you can use to build and run the application on your machine. They are all located in the dev-utils folder. 

You can add additional parameters to each script to skip the build or to skip starting the application. 
```
$ build.sh skip-build
$ build.sh skip-start
```

This script will make locak docker images with s2i using the source code from the local current branch
```
$ build.sh
```
This script will make local docker images with s2i using the source code from the remote master branch
```
$ build_master.sh
```
This script will make local docker images with s2i using the source code from the remote develop branch
```
$ build_develop.sh
```

## If all else fails, i.e. I do not use docker  ##
### Java ###
Build the application using maven
```
$ mvn validate
$ mvn clean install
```
If you do not have maven installed locally consider using the maven wrapper in the root of the repository
```
$ ./mvnw validate
$ ./mvnw clean install
```
Run the application using java
```sh
$ java -jar api/target/SERVICE-VERSION.jar
```
### dotnet core ###

### node ###
[back](../README.md)