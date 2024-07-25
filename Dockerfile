FROM node:22

ENV INPUT="./"
ENV OUTPUT="./codeql_result.sarif"

RUN apt update && apt install wget && apt clean

RUN wget https://github.com/github/codeql-action/releases/download/codeql-bundle-v2.18.1/codeql-bundle-linux64.tar.gz
RUN tar xvfz codeql-bundle-linux64.tar.gz
RUN /codeql/codeql pack download codeql/javascript-queries
RUN mkdir -p /project

COPY run.sh /run.sh

WORKDIR /project

ENTRYPOINT /run.sh ${INPUT} ${OUTPUT}
