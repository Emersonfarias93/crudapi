# Usando uma imagem oficial do OpenJDK
FROM openjdk:17-jdk-slim

# Definindo o diretório de trabalho
WORKDIR /app

# Copiar o arquivo pom.xml e as dependências do projeto
COPY pom.xml .

# Baixar as dependências (isso ajudará a cachear as dependências e acelerar builds futuros)
RUN mvn dependency:go-offline -B

# Copiando o arquivo JAR para o container
COPY target/crudapi-0.0.1-SNAPSHOT.jar app.jar

## Rodar o comando 'mvn install' para compilar e instalar o projeto
#RUN mvn install

# Comando padrão para manter o container rodando ou executar algo adicional, como rodar a aplicação
# Caso seja uma aplicação, este comando deve ser substituído pelo comando de execução da app.
CMD ["mvn", "clean", "package"]

# Expondo a porta da aplicação
EXPOSE 8080

# Comando para rodar o JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
