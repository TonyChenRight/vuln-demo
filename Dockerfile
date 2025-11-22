# 使用官方的 OpenJDK 21 作为基础镜像
FROM openjdk:21
 # 设置工作目录
WORKDIR /app
VOLUME /app/logs
VOLUME /app/config
 # 将应用程序的 JAR 文件复制到容器中
COPY ./target/vulnerability-library.jar app.jar
# 暴露应用程序的端口
EXPOSE 8081
# 设置环境变量
ENV PROFILE_ENV="dev"
# 运行应用程序
ENTRYPOINT  ["java","-jar","app.jar","--spring.profiles.active=${PROFILE_ENV}"]
