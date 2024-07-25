#!/bin/sh

INPUT=$1
OUTPUT=$2

echo "Running with INPUT=${INPUT} and OUTPUT=${OUTPUT}..."

/codeql/codeql database create /codeql-db --overwrite --source-root=${INPUT} --language=javascript
/codeql/codeql database analyze /codeql-db --format=sarif-latest --output=${OUTPUT} -- codeql/javascript-queries
