FROM python:3-slim

RUN apt-get update
RUN apt-get install -y libreoffice-core --no-install-recommends
RUN apt-get install -y libreoffice-java-common
RUN apt-get install -y default-jre-headless
RUN apt-get install -y libreoffice-writer
# RUN apt-get install -y libreoffice

WORKDIR /app
RUN mkdir /app/uploads/

ENV TZ Asia/Shanghai

RUN pip install flask -i https://mirrors.aliyun.com/pypi/simple/

COPY app.py .

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]
