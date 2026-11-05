FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY app.java .
# RUN java app.java  
CMD ["java","app.java"]
