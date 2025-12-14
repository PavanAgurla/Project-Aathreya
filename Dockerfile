# ===========================
# Stage 1: Build
# ===========================
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /workspace

# Copy Maven files
COPY apps/pom.xml ./
COPY apps/src ./src

# Build the project (skip tests)
RUN mvn -B -DskipTests package -f pom.xml

# ===========================
# Stage 2: Runtime
# ===========================
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy jar from build stage
COPY --from=build /workspace/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
