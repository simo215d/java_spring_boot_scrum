# Scrum board API made with java, spring-boot & sql

## Spring-boot
Spring er et lightweight framework, som gør det lettere, at udvikle loosely coupled systemer med java. Spring features:
* Dependency injection med application context 
* database connection, querying & transactions
* spring mvc gør det lettere, at udvikle APIs og websites

Spring boot er bygget oven på spring. Det er lettere, at konfigurere projekter og bruges primært til, at lave REST APIs med.

## Frontend
Frontend bliver et seperat projekt lavet med Angular frameworket

## Maven
Maven er ligesom gradle et værktøj til, at gøre building og dependencies/plugins lettere at arbejde med

## Architecture
![architecture](https://user-images.githubusercontent.com/54975711/152683836-51d27ce0-1f24-4633-bfc4-34b94fe767e2.png)

## Testing
Minumin lidt om unit testing

## CI/CD
For at undgå "integration hell", så vil vi gerne lave integration ofte (continuous integration). Men compiling, testing & packaging kan tage meget lang tid hvis man skal gør det ofte og kan blokere ens arbejde. Derfor kan vi gøre CI nemmere ved, at outsource dette til en VM via f.eks. GitHub actions. Vi kan sette den til automatisk, at compile, teste og package hver gang vi laver en push eller merge, så vi slipper for, at gøre det lokalt.

På samme måde for, at gøre deployment hurtigere kan det også automatiseres med GitHub actions, som f.eks. vil ske hver gang der er en succesfuld push på master.


Før vi kan automatisere processerne, så skal man først være klar over hvordan man gør det manuelt. 

Integration:<br>
Compiling, testing og packaging jar foregår med Maven, da det er sådan projektet er sat op. Med Maven så er der noget der hedder "lifecycles". Heri er der en masse funktioner vi kan kalde, som udfører f.eks. testing osv. Vi kan kalde disse lifecycle faser med terminalen hvis mvn er installeret.

Deployment:<br>
Jeg har en Azure VM. Jeg har installeret Docker på den. Jeg skal dermed bygge en docker image, push den til dockerhub og fortælle min VM, at den skal pull & run det image. Den måde jeg fortælle min Azure VM, at den skal pull & run det nye image kan f.eks. være med SSH. Dog vil det kræve en .pem nøgle og det gad jeg ikke oploade til mit offentlige repo. Så jeg lavede i stedet for en REST API med basic authentication. Den har et GET endpoint der hedder update. Den API fungere kun hvis man indsender username og password, så den er sikret sådan. Det endpoint starter et bash script, som downloader det nye image, fjerne det gamle og kører det nye. 


Actual implementation is found in the actions workflow yml file.


On pushes into all branches:
* Maven verify (compile, test & package jar)

On merges and pushes on master:
* Containerize the jar with Docker and push it to dockerhub
* Tell the azure VM to pull and run that container image from dockerhub
