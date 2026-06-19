# Docker Mini Project - PayMyBuddy

This repository contains my Docker bootcamp project based on the PayMyBuddy application.

## Objectives

- Containerize a Spring Boot application
- Deploy a MySQL database in a container
- Use Docker Compose for orchestration
- Persist database data with volumes
- Externalize configuration with environment variables

## Architecture

- paymybuddy-backend (Spring Boot)
- paymybuddy-db (MySQL 8)

## Files

- Dockerfile
- docker-compose.yml
- .env.example
- initdb/create.sql

## Run

Copy the environment file:

```bash
cp .env.example .env
```

Start the stack:

```bash
docker compose up -d --build
```

Check containers:

```bash
docker ps
```

Access the application:

```text
http://localhost:8080
```

## Docker Registry

Example:

```bash
docker tag paymybuddy-backend localhost:5000/paymybuddy-backend:1.0

docker push localhost:5000/paymybuddy-backend:1.0
```

## Screenshots

Add screenshots here after validation on Play With Docker.
