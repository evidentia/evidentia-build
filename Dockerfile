FROM openjdk:8-jdk-slim
RUN apt-get update
RUN apt-get install -y git nodejs curl build-essential python-pip 

ENV SBT_VERSION 0.13.11

RUN curl -sL "https://dl.bintray.com/sbt/native-packages/sbt/${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

RUN pip install -vU setuptools
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g grunt-cli
ENV PATH=/usr/local/sbt/bin:$PATH

WORKDIR /usr/src/app
