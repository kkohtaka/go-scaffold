#!/bin/bash
# Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
# This file is available under the MIT license.

set -e

COVERAGE_FILE=coverage.txt
TMP_FILE=tmp.txt

echo '' > $COVERAGE_FILE

for DIR in $(find . -type d); do
  if ls $DIR/*.go &> /dev/null; then
    go test -v -coverprofile=$TMP_FILE -covermode=count $DIR
    if [ -f $TMP_FILE ]; then
      cat $TMP_FILE >> $COVERAGE_FILE
      rm $TMP_FILE
    fi
  fi
done
