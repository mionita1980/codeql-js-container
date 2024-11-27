# Build Image

```bash
export CODEQL_VERSION=$(head -n 1 ./codeql.version)
docker build . --build-arg CODEQL_VERSION=${CODEQL_VERSION} --tag mionita1980/codeql-js:${CODEQL_VERSION} --tag mionita1980/codeql-js:latest
docker push mionita1980/codeql-js:${CODEQL_VERSION}
docker push mionita1980/codeql-js:latest
```

# Use Image

```bash
docker run -it --rm -v $(pwd):/project/ --env INPUT="./" --env OUTPUT="./result.sarif" mionita1980/codeql-java
```
