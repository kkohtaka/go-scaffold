// Copyright (c) 2016 Kazumasa Kohtaka. All rights reserved.
// This file is available under the MIT license.

package feature

import "fmt"

func Greet(name string, lang string) string {
	switch lang {
	case "en":
		return fmt.Sprintf("Hello, %s.", name)
	case "ja":
		return fmt.Sprintf("こんにちは, %s.", name)
	}
	return "..."
}
