# --- Build stage ---
FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY backend/pom.xml backend/pom.xml
RUN mvn -q -e -B -f backend/pom.xml -DskipTests dependency:go-offline
COPY backend backend
RUN mvn -q -e -B -f backend/pom.xml -DskipTests package
# --- Runtime stage ---
FROM eclipse-temurin:17-jre-alpine
ENV SPRING_PROFILES_ACTIVE=prod
WORKDIR /app
COPY --from=build /app/backend/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
