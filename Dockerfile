# Dockerfile

# pull the official docker image
FROM python:3.9.4-slim

# set work directory
WORKDIR /app

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update && apt install -y gcc g++ zlib1g-dev libxml2-dev libxslt-dev
RUN apt upgrade -y

RUN /usr/local/bin/python -m pip install --upgrade pip
# install dependencies
COPY ./requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt
# RUN pip install -r requirements.txt

# copy project
COPY . .

