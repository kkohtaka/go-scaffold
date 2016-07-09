#!/bin/bash
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

set -e

COVERAGE_FILE=coverage.txt
TMP_FILE=tmp.txt

COVERMODE=atomic

echo "mode: $COVERMODE" > $COVERAGE_FILE

for PKG in $(go list ./...); do
  go test -v -coverprofile=$TMP_FILE -covermode=$COVERMODE $PKG
  if [ -f $TMP_FILE ]; then
    cat $TMP_FILE | tail -n +2 >> $COVERAGE_FILE
    rm $TMP_FILE
  fi
done

go tool cover -html=coverage.txt -o coverage.html
