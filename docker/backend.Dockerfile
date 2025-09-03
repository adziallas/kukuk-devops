FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app
COPY backend/pom.xml .
RUN mvn -q -e -B -DskipTests dependency:go-offline
COPY backend/ src/
RUN mvn -q -e -B -DskipTests package

FROM eclipse-temurin:17-jre-alpine
ENV SPRING_PROFILES_ACTIVE=prod
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
