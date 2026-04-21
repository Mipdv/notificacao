FROM eclipse-temurin:21-jdk-alpine as  build

WORKDIR /app
COPY . .
RUN ./gradlew build -x test --no-daemon

FROM eclipse-temurin:21-jdk-alpine
COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8085

CMD ["java","-jar", "/app/notificacao.jar"]
