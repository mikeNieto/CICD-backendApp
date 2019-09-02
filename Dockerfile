FROM openjdk:8-jre-alpine
ADD build/libs/CICD-backendApp.jar /opt/backendApp/CICD-backendApp.jar

EXPOSE 8082

ENTRYPOINT ["java", "-Xmx1024m", "-Dspring.profiles.active=prod", "-jar", "/opt/backendApp/CICD-backendApp.jar"]
