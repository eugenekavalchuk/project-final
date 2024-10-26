FROM openjdk:17
COPY target/jira-1.0.jar app.jar
COPY target/classes/com /com
COPY resources /resources
ENTRYPOINT ["java", "-jar", "/app.jar"]