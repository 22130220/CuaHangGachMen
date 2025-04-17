# Sử dụng image Gradle chính thức với JDK (OpenJDK) làm base image cho giai đoạn build
FROM gradle:8.10-jdk21 AS build

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Copy toàn bộ mã nguồn dự án vào container
COPY . .

# Chạy lệnh Gradle để build ứng dụng, tạo file .war
# --no-daemon để tránh Gradle daemon trong container
RUN gradle clean build --no-daemon

# Sử dụng image Tomcat chính thức cho giai đoạn chạy ứng dụng
FROM tomcat:10.1.36-jre21

# Xóa các ứng dụng mặc định của Tomcat để giữ container gọn nhẹ
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war từ giai đoạn build sang thư mục webapps của Tomcat
COPY --from=build /app/build/libs/*.war /usr/local/tomcat/webapps/ROOT.war

# Cổng mặc định của Tomcat
EXPOSE 8080

# Lệnh khởi động Tomcat
CMD ["catalina.sh", "run"]
