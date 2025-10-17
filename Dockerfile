FROM node:22
ARG CODEQL_VERSION

ENV INPUT="./"
ENV OUTPUT="./codeql_result.sarif"
ENV VERSION=$CODEQL_VERSION

#additional utils
RUN apt update && apt install wget && apt clean

#Look for the newest version in https://github.com/github/codeql-action/releases
RUN wget https://github.com/github/codeql-action/releases/download/codeql-bundle-v${VERSION}/codeql-bundle-linux64.tar.gz
RUN tar xvfz codeql-bundle-linux64.tar.gz
RUN /codeql/codeql pack download codeql/javascript-queries
RUN mkdir -p /project

COPY run.sh /run.sh
RUN chmod +x /run.sh

WORKDIR /project

ENTRYPOINT /run.sh ${INPUT} ${OUTPUT}
