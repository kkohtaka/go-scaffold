// Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
// This file is available under the MIT license.

package main

import (
	"fmt"
	"os"

	"github.com/kkohtaka/go-scaffold/feature"
)

func main() {
	var name string
	if len(os.Args) > 1 {
		name = os.Args[1]
	} else {
		name = "World"
	}

	var lang string
	if len(os.Args) > 2 {
		lang = os.Args[2]
	} else {
		lang = "en"
	}

	fmt.Printf("%s\n", feature.Greet(name, lang))
}
