# springboot-docker-image
springboot customized image

### packaging source code

`./mvnw package`

### base image openjdk:8-jdk-alpine

```text
FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com/pxample/pemo/PemoApplication"]
```

image size 122M with this dockerfile


### base image eclipse-temurin:8-jre-alpine

```text
FROM eclipse-temurin:8-jre-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com/pxample/pemo/PemoApplication"]
```

image size 155M with this dockerfile


### Usage

**packaging**

`./prepare.sh`

**build and run**

`./build.sh Dockerfile-openjdk8-alpine springboot-alpine`

### Ref

[Spring Boot with Docker](https://spring.io/guides/gs/spring-boot-docker/)

[Spring Boot Docker](https://spring.io/guides/topicals/spring-boot-docker)
