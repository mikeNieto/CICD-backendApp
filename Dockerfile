FROM gradle as builder
ADD . .
RUN gradle bootJar

FROM openjdk:8-jre-alpine
COPY --from=builder /home/gradle/build/libs/CICD-backendApp.jar /opt/backendApp/CICD-backendApp.jar

ENTRYPOINT ["java", "-Xmx1024m", "-Dspring.profiles.active=prod", "-jar", "/opt/backendApp/CICD-backendApp.jar"]
