FROM python:3-slim

# RUN echo 'deb http://mirrors.aliyun.com/debian/ bullseye main\ndeb-src http://mirrors.aliyun.com/debian/ bullseye main\ndeb http://mirrors.aliyun.com/debian-security/ bullseye-security main\ndeb-src http://mirrors.aliyun.com/debian-security/ bullseye-security main\ndeb http://mirrors.aliyun.com/debian bullseye-updates main\ndeb-src http://mirrors.aliyun.com/debian/ bullseye-updates main' > /etc/apt/sources.list

RUN apt-get update
# RUN apt-get install libreoffice -y
RUN apt-get install -y libreoffice-core --no-install-recommends
RUN apt-get install -y libreoffice-java-common
RUN apt-get install -y default-jre-headless

WORKDIR /app
RUN mkdir /app/uploads/

ENV TZ Asia/Shanghai

RUN pip install flask -i https://mirrors.aliyun.com/pypi/simple/

COPY app.py .

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]
