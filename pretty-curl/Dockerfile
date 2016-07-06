FROM ubuntu:16.04
MAINTAINER Jakub Stas

USER root
WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl \
    npm \
    python-setuptools \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g json
RUN easy_install pygments

RUN echo "\nfunction jcurl() {\n\tcurl \"\$@\" | json_pp | pygmentize -l json\n}\n\nexport jcurl" >> .bashrc