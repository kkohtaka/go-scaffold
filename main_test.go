// Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
// This file is available under the MIT license.

package main

import (
	"os"
	"testing"
)

func TestMain(m *testing.M) {
	// flag.Parse()
	os.Exit(m.Run())
}
