# Usando uma imagem oficial do OpenJDK
FROM openjdk:17-jdk-slim

# Definindo o diretório de trabalho
WORKDIR /app

# Copiando o arquivo JAR para o container
COPY target/crudapi-0.0.1-SNAPSHOT.jar app.jar

# Expondo a porta da aplicação
EXPOSE 8080

# Comando para rodar o JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
