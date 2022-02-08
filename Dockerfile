#FROM openjdk:11
FROM openjdk:11-jre-slim

#copy <src> to <dest>
COPY target/demo-0.0.1-SNAPSHOT.jar /usr

WORKDIR /usr

RUN java -jar demo-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
