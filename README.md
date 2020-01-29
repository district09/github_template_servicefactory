# README #

*Insert short description of the application here.*

## API Contract ##
* [OpenAPI & asyncAPI](./openapi/README.md)

## Running locally ##

Read the [documentation](./dev-utils/README.md) provided in the dev-utils folder to build and run the application locally.

## Testing the application ##

We run integration tests on our applications in CICD using the [Karate framework](https://github.com/intuit/karate). See the [testing documentation](./karate/README.md) on how to run the tests locally and more information. 

## Build environment variables ##

Here you will find all environment variables used in an s2i build to docker or openshift. Feed these envars to your local s2i build or openshift build config.

Envar | Required | Default | Description
:---|:---:|:---:|:---
MAVEN_ARGS | if maven build | see openshift configmap | The Maven arguments used in a s2i build
ARTIFACT_DIR | if maven build | target | The artifact dir that s2i get its compiled binary's from
NEXUS_PASSWORD | if using digipolis nexus | in openshift secret | Pasword to connect to the Digipolis Nexus
NEXUS_USER | if using digipolis nexus | in openshift secret | User to connect to the Digipolis Nexus

## Deployment environment variables ##

Here you will find all environment variables used to deploy the application to docker or openshift. Feed these envars to your local deployment or openshift deployment config.

#### component-1 ####

Envar | Required | Default | Description
:---|:---:|:---:|:---
1 | **yes** | default | 2
2 | no | no-default | 3

#### component-2 ####

Envar | Required | Default | Description
:---|:---:|:---:|:---
1 | **yes** | default | 2
2 | no | no-default | 3

#### List of required envars ####

##### Database #####
DB_USER (Secret)
DB_PASSWORD (Secret)
DB_HOST
DB_PORT
DB_PROTOCOL
DB_DRIVER

##### Event broker #####
AMQ_USER/AMQ_USER_XXX (Secret)
AMQ_PASSWORD/AMQ_PASSWORD_XXX (Secret)
AMQ_HOST
AMQ_PORT
AMQ_PROTOCOL
AMQ_DRIVER
AMQ_QUEUE_PREFIX
AMQ_DLQ
AMQ_EVENT_XXX
AMQ_QUEUE_XXX
AMQ_TOPIC_XXX
AMQ_POOL

##### Application specifics #####
APP_ENVIRONMENT
APP_LOG_LEVEL
APP_MOCKING
APP_SERVE_SWAGGER
APP_SERVE_ASYNCAPI
APP_PORT
APP_SCHEME
APP_NAMESPACE_PREFIX
APP_VERSION

##### Healthcheck speficis #####
HEALTH_MAX_QUEUE_SIZES_XXX
HEALTH_MAX_REPOSITORY_ENTRIES_XXX

##### About application info #####
INFO_ID
INFO_NAME
INFO_DESCRIPTION
INFO_PROTOCOL
INFO_OWNERS
INFO_VERSION
INFO_HOST
INFO_PROJECT_REPO
INFO_PROJECT_HOME

##### For connections with other API's #####
API_KEY_XXX (S)
API_URL_XXX

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
* [Developer Portal DV](https://developerdv.gent.be/)
* [Developer Portal DV](https://developerqa.gent.be/)
* [Developer Portal DV](https://developer.gent.be/)
