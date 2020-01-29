cd healthcheck
curl -v -u admin:admin123 -F "maven2.generate-pom=true" -F "maven2.groupId=gent.digipolis.servicefactory" -F "maven2.artifactId=healthcheck" -F "maven2.packaging=jar" -F "version=0.0.11" -F "maven2.asset1=@healthcheck-0.0.11.jar;type=application/java-archive" -F "maven2.asset1.extension=jar" "http://localhost:9091/service/rest/v1/components?repository=maven-releases"
