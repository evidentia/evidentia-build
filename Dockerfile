FROM alpine
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories
RUN apk update
RUN apk add openjdk8 git nodejs curl py-pip bash
RUN curl -sL "https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-0.13.11.tgz" | gunzip | tar -x -C /usr/local && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built
RUN pip install -vU setuptools
RUN apk add nodejs nodejs-npm
RUN npm install -g grunt-cli
ENV PATH=/usr/local/sbt/bin:$PATH

WORKDIR /usr/src/app
