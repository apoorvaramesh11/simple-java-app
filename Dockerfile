FROM openjdk:17-jdk-slim

WORKDIR /app

COPY app.java .

RUN javac app.java

CMD ["java", "app"]
