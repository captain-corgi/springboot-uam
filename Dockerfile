FROM openjdk:8-jre-alpine
RUN mkdir /uam /uam/log \
	&& chmod 777 /uam/log
COPY build/libs/uam.jar /uam/
ADD build/libs/uam.jar uam.jar
WORKDIR /uam

# ENTRYPOINT ["java", "-jar","-Dspring.profiles.active=${TARGET_ENV}", "-Dspring.datasource.username=${DB_USER_NAME}", "-Dspring.datasource.password=${DB_PASSWORD}", "skeleton_service.jar"]
# ENTRYPOINT ["java", "-jar", "skeleton_service.jar", " --server.port=${PORT}"]
ENTRYPOINT ["java", "-jar", "skeleton_service.jar", " --server.port=8082"]