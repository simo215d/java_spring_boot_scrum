#FROM openjdk:11
FROM openjdk:11-jre-slim

RUN ls /usr

#copy <src> to <dest>
COPY ./target/ /usr/javaprogram

RUN ls /usr

WORKDIR /usr/javaprogram

RUN java -jar demo-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
