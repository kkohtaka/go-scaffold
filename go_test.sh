#!/bin/bash
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

set -e

COVERAGE_FILE=coverage.txt
COVERAGE_HTML_FILE=coverage.html
TMP_FILE=tmp.txt

COVERMODE=count

echo "mode: $COVERMODE" > $COVERAGE_FILE

for PKG in $(go list ./...); do
  go test -v -coverprofile=$TMP_FILE -covermode=$COVERMODE $PKG
  if [ -f $TMP_FILE ]; then
    cat $TMP_FILE | tail -n +2 >> $COVERAGE_FILE
    rm $TMP_FILE
  fi
done

go tool cover -html=$COVERAGE_FILE -o $COVERAGE_HTML_FILE
