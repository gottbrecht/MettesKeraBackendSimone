FROM openjdk:17-jdk-bullseye
WORKDIR /app
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
RUN apt-get update && apt-get install dos2unix
RUN dos2unix mvnw
RUN chmod +x mvnw && ./mvnw dependency:resolve
COPY src ./src
CMD ["./mvnw", "spring-boot:run"]



