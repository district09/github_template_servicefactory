#!/usr/bin/env groovy

/**
## Parameters

* `kind`: The kind of project that needs to be build. This refers to the jenkins slave needed to do a basic build of the project. Possible values are `maven`, `nodejs`, `node16`, `netcore31`, ... (Required)
* `namespace`: The project namespace (Required)
* `service`: Array of services that need to be build (Required)
* `buildScript`: Custom buildscript that will run during the `Build and test` stage. Overrides the *default build and test execution*.
* `templatepath`: Use to override default openshift templates path. Default path is "root/openshift/" (Optional)
* `dotnetFolder`: The root folder where the project file is located.
* `dotnetSlnFile`: The name of the project file. 
* `dotnetTestFolder`: The folder where the test project file is located. No need to repeat the root, `dotnetFolder` is added in the pipeline. 
* `dotnetTestFile`: The name of the test project file. 
* `mainBranch`: Overwrites the main branch (default: `master`).
* `repositoryUrl`: Git url where the project is located
* `gitCredentials`: CredentialID to use for git interactions
* `useSemanticRelease`: When `true`, this will generate a changelog based on the [conventional-commit](https://www.conventionalcommits.org/en/v1.0.0/) guidelines.
* `openshiftDeployImage`: Use this to override the default Openshift image to mirror between clusters
* `intermediateSuffix`: Used to split multi-staged builds, i.e. 'node'
**/

d09Project  kind: "", 
            namespace: "", 
            service: [""],
            buildScript: "", 
            templatepath: "", 
            dotnetFolder: "",
            dotnetSlnFile: "", 
            dotnetTestFolder: "",
            dotnetTestFile: "",
            mainBranch: "",
            repositoryUrl: "",
            gitCredentials: "",
            useSemanticRelease: "",
            openshiftDeployImage: "",
            intermediateSuffix: ""
