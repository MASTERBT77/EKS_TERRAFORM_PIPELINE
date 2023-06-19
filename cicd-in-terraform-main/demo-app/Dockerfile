FROM python:3.8-slim-buster

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/. .
RUN pip3 install -r requirements.txt

ENV FLASK_APP=helloworld_api.py
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]