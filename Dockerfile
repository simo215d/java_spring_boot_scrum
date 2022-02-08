#FROM openjdk:11
FROM openjdk:11-jre-slim

RUN ls /usr

#copy <src content from outer system> to <dest to container system>
COPY ./target/ /usr/javaprogram

RUN ls /usr

WORKDIR /usr/javaprogram

RUN ls

#RUN java -jar spring_boot_scrum-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "spring_boot_scrum-0.0.1-SNAPSHOT.jar"]
