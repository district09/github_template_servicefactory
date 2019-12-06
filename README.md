# README #

*Insert short description of the application here.*

## API Contract ##
* [OpenAPI & asyncAPI](./openapi/README.md)

## Running locally ##

Read the [documentation](./dev-utils/README.md) provided in the dev-utils folder to build and run the application locally.

## Testing the application ##

We run integration tests on our applications in CICD using the [Karate framework](https://github.com/intuit/karate). See the [testing documentation](./karate/README.md) on how to run the tests locally and more information. 

## Environment variables ##

Here you can find all environment variables that are used to make the application work. Required envars are shown in **bolt**. Set these envars on your local machine or feed them to your dockers. 

#### component1-api ####

Envar | Description | Default | Required
:---:|:---:|:---:|:---:
1 | 2 | default | **yes**
2 | 3 | no-default | no

#### component2-worker ####

Envar | Description | Default | Required
:---:|:---:|:---:|:---:
1 | 2 | default | **yes**
2 | 3 | no-default | no

## CICD ##

Mainly [Jenkins](https://jenkins.io/) in combination with [Openshift Container Platform](https://www.openshift.com/) and other cloud based platforms are used for builds and deployments onto the Digipolis Service Factory.

See the [Jenkinsfile](./Jenkinsfile) to define the CICD pipiline. 

See the [openshift](./openshift/README.md) folder to define the Openshift configuration. 

## Issues ##

Log and track issues in our [Jira](https://digipolisgent.atlassian.net/)

### Architecture ###

*Insert Architecture Design here.*

## API Documentation ##
* [Digipolis API Guidelines](https://github.com/digipolisgent/api-guidelines)
* [Service Factory Confluence](https://digipolisgent.atlassian.net/wiki/spaces/SF/overview)
* [Develloper Portal DV](https://developerdv.gent.be/)
* [Develloper Portal DV](https://developerqa.gent.be/)
* [Develloper Portal DV](https://developer.gent.be/)
