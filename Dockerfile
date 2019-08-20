FROM openjdk:8-jre-alpine
ADD build/libs/CICD-backendApp.jar /opt/backendApp/CICD-backendApp.jar

ENTRYPOINT ["java", "-Xmx1024m", "-Dspring.profiles.active=prod", "-jar", "/opt/backendApp/CICD-backendApp.jar"]
