FROM openjdk:17
WORKDIR /app

# Copy Maven Wrapper and pom.xml
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

# Convert line endings and resolve dependencies
RUN apt-get update && apt-get install -y dos2unix \
    && dos2unix mvnw \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && chmod +x mvnw && ./mvnw dependency:resolve

# Copy source code
COPY src ./src

# Expose port (if your app is a web server)
EXPOSE 8080

# Run the application
CMD ["./mvnw", "spring-boot:run"]



