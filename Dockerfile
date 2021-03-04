FROM ubuntu:trusty  

RUN apt-get -y update && apt-get -y install vim wget software-properties-common
RUN apt-get -y install postgresql-client  
RUN apt-get -y update

RUN useradd reddit
#USER reddit
WORKDIR /home/reddit
ENV REDDIT_USER=reddit
ENV INSTALL_PROFILE=all

COPY install install
COPY install-reddit.sh install-reddit.sh

#this needs to say "yes"
#RUN sudo ./install-reddit.sh
COPY run.sh run.sh
RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]


