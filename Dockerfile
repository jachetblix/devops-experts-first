FROM ubuntu:22.10

RUN apt-get update -y && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app


CMD ["python3","rest_app.py"]
#FROM python:3.8-alpine3.17
#COPY . /app
#WORKDIR /app
#RUN pip3 install --upgrade pip
#RUN pip3 install -r requirements.txt
#CMD ["python3", "web_app.py","rest_app.py"]

