# Openshift Configuration #

This folder contains the Openshift configuration files required for deployments using our CICD tool and Openshift Application Platform. 

We have a configuration file for each environment and each of the components of your application.
* [openshift-build-api.yml]()
* [openshift-build-worker.yml]()
* [openshift-build-frontend.yml]()
* [openshift-dv-api.yml]()
* [openshift-dv-worker.yml]()
* [openshift-dv-frontend.yml]()
* [openshift-qa-api.yml]()
* ...
* [openshift-pr.yml]()
* ...

The prefix has to be fixed. For builds use "openshift-build-component" and for deployments use "openshift-dv/qa/st/pr-component".

* Do not change the prefixes in the names of the files! 
* You can add as many components as you like, just know that every component will be build and deployed at the same time!

## Openshift template #

An Openshift template consists of at least 4 objects. Each object defines a kubernetes object in Openshift. 
* ImageStream
* BuildConfig
* DeploymentConfig
* Service

Additional objects can be used.
* Route
* ServiceAccount
* ...

## Parameters ##

Filling in the parameters for each component in the build & deployment template should be enough to get you started. See environment variables for extra configuration of your application. 

## Metadata object ##

The metadata object should be consistent among all objects. 
```
  metadata:
    name: $COMPONENT
    namespace: $NAMESPACE
    labels:
      app: $APPLICATION
      component: $COMPONENT
```

## Environment variables ##

All environment variables used by the application are configured in the DeploymentConfig. Secrets and configmaps are added in Openshift. 
```
spec:
  containers:
  - env:
    - name: PASSWORD
      valueFrom:
        secretKeyRef:
          name: COMPONENT-secrets
          key: PASSWORD
    - name: CONFIGMAP
      valueFrom:
        configMapKeyRef:
          name: COMPONENT-configmap
          key: sampleConfig
    - name: ENVAR
      value: update
```

[back](../README.md)