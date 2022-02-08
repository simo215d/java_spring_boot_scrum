FROM openjdk:11

#copy <src> to <dest>
COPY ./target/demo-0.0.1-SNAPSHOT.jar /usr

WORKDIR /usr

RUN javac DemoApplication.java

CMD ["java", "DemoApplication"]
