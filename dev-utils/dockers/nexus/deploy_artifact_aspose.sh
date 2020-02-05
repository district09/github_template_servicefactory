cd aspose
curl -v -u admin:admin123 -F "maven2.generate-pom=true" -F "maven2.groupId=com.aspose" -F "maven2.artifactId=aspose-words" -F "maven2.packaging=jar" -F "version=18.9" -F "maven2.asset1=@aspose-words-18.9-jdk16.jar;type=application/java-archive" -F "maven2.asset1.extension=jar" "http://localhost:9091/service/rest/v1/components?repository=maven-releases"
