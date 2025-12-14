# Build stage
FROM maven:3.9.0-jdk-17 AS build
WORKDIR /workspace
COPY app/pom.xml ./
COPY app/src ./src
RUN mvn-B-DskipTests package-f pom.xml
# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY--from=build /workspace/target/*.jar app.jar# Build stage
FROM maven:3.9.0-jdk-17 AS build
WORKDIR /workspace

# Copy Maven files
COPY app/pom.xml ./ 
COPY app/src ./src

# Build the project (skip tests)
RUN mvn -B -DskipTests package -f pom.xml

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy jar from build stage (note the spaces!)
COPY --from=build /workspace/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
