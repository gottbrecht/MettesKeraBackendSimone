FROM openjdk:17-jdk-bullseye
WORKDIR /app

# Copy Maven Wrapper and pom.xml
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Convert line endings and resolve dependencies
RUN chmod +x mvnw && ./mvnw dependency:resolve

# Copy source code
COPY src ./src

# Run the application
CMD ["./mvnw", "spring-boot:run"]



