# Scrum board API made with java, spring-boot & sql

Spring er et lightweight framework, som gør det lettere, at udvikle loosely coupled systemer med java. Spring features:
* Dependency injection med application context 
* database connection, querying & transactions
* spring mvc gør det lettere, at udvikle APIs og websites

Spring boot er bygget oven på spring. Det er lettere, at konfigurere projekter og bruges primært til, at lave REST APIs med.


## Maven
Maven er ligesom gradle et værktøj til, at gøre building og dependencies/plugins lettere at arbejde med

## Architecture
![architecture](https://user-images.githubusercontent.com/54975711/152683836-51d27ce0-1f24-4633-bfc4-34b94fe767e2.png)

## Testing
Minumin lidt om unit testing

## CI/CD
Pipeline with GitHub actions:
* Commit pushed into master
* Tests run
* Project builds a jar and puts that jar
* Containerize the jar with Docker and push it to dockerhub
* Tell the azure VM to pull and run that container image from dockerhub
