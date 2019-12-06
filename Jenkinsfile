#!/usr/bin/env groovy

/**

Set following parameters that will be passed to the shared Jenkins pipeline. 

kind: The type of Jenkins slave that will conduct the CICD build. 
- maven
- netcore21
- netcore22
- node8

namespace: Openshift namespace without environment suffix, i.e.:
- "services" 
- "dossier"

service: Array with names of the components to be build and deployed by CICD, i.e.:
- ["jobsheduler-api"]
- ["email-api","email-worker"]

**/

dgPipeline kind: "$kind", namespace: "$namespace", service: ["$component1","$component2"]
