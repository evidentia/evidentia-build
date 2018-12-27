FROM openjdk:11-jdk-slim
RUN apt-get update
RUN apt-get install -y git nodejs curl build-essential python-pip
RUN pip install -vU setuptools
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g grunt-cli

ENV SCALA_VERSION 2.12.8
ENV SBT_VERSION 1.2.7

# Install Scala
RUN \
  curl -fsL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

# Install sbt
RUN curl -sL "https://piccolo.link/sbt-${SBT_VERSION}.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

ENV PATH=/usr/local/sbt/bin:$PATH

WORKDIR /usr/src/app
