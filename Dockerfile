FROM maven:3.8.5-openjdk-17 AS  build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/Project-Ebank-0.0.1-SNAPSHOT.jar Project-Ebank.jar
EXPOSE 8085
ENTRYPOINT [ "java","-jar","Project-Ebank.jar" ]