# ── Stage 1: Build ────────────────────────────────────────────────────────────
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Cache dependencies separately (re-downloads only when pom.xml changes)
COPY pom.xml .
RUN mvn dependency:go-offline -B --no-transfer-progress

# Copy source and build
COPY src ./src
RUN mvn clean package -DskipTests -B --no-transfer-progress

# ── Stage 2: Run ──────────────────────────────────────────────────────────────
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Non-root user for security
RUN addgroup -S bank && adduser -S bank -G bank
USER bank

COPY --from=build /app/target/*.jar app.jar

# Railway & Render inject PORT — Spring Boot reads server.port=${PORT:8080}
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
