FROM python:3.7.6-buster

RUN apt-get update \
    && apt-get install default-libmysqlclient-dev 

WORKDIR /home/neighbor


COPY requirements requirements
RUN python3 -m venv venv


RUN venv/bin/pip install -r requirements/docker.txt

COPY app app
COPY seeddata seeddata
COPY migrations migrations
COPY flasky.py config.py boot.sh sheets_token.pickle ./

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
