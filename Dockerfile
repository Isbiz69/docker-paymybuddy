# syntax=docker/dockerfile:1

FROM maven:3.9-eclipse-temurin-17-alpine AS build

RUN apk add --no-cache git

WORKDIR /workspace

# The application source is provided by the Eazytraining bootcamp repository.
RUN git clone --depth 1 https://github.com/eazytraining/bootcamp-project-update.git .

WORKDIR /workspace/mini-projet-docker
RUN mvn --batch-mode --no-transfer-progress -DskipTests clean package

FROM amazoncorretto:17-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=build /workspace/mini-projet-docker/target/paymybuddy.jar /app/paymybuddy.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/paymybuddy.jar"]
