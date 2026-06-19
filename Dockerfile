# syntax=docker/dockerfile:1

# -----------------------------------------------------------------------------
# Backend build stage
# -----------------------------------------------------------------------------
FROM maven:3.9-eclipse-temurin-17-alpine AS backend-build

WORKDIR /build

COPY pom.xml .
RUN mvn --batch-mode --no-transfer-progress dependency:go-offline

COPY src ./src
RUN mvn --batch-mode --no-transfer-progress -DskipTests clean package

# -----------------------------------------------------------------------------
# Backend runtime image
# Build with: docker build --target backend -t <registry>/paymybuddy-backend:1.0 .
# -----------------------------------------------------------------------------
FROM amazoncorretto:17-alpine AS backend

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=backend-build /build/target/paymybuddy.jar /app/paymybuddy.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/paymybuddy.jar"]

# -----------------------------------------------------------------------------
# Database image
# Build with: docker build --target database -t <registry>/paymybuddy-db:1.0 .
# -----------------------------------------------------------------------------
FROM mysql:8.0 AS database

COPY initdb/create.sql /docker-entrypoint-initdb.d/01-create.sql
