## Avoid global variables
## 避免使用全局变量

**Don't:**
```go
var db *sql.DB

func main() {
	db = // ...
	http.HandleFunc("/drop", DropHandler)
	// ...
}

func DropHandler(w http.ResponseWriter, r *http.Request) {
	db.Exec("DROP DATABASE prod")
}
```

Global variables make testing and readability hard and every method has access to them (even those, that don't need it).

全局变量使测试和可读性变得困难，并且每种方法都可以访问它们（甚至不需要它们的那些方法）。

**Do:**
```go
func main() {
	db := // ...
	handlers := Handlers{DB: db}
	http.HandleFunc("/drop", handlers.DropHandler)
	// ...
}

type Handlers struct {
	DB *sql.DB
}

func (h *Handlers) DropHandler(w http.ResponseWriter, r *http.Request) {
	h.DB.Exec("DROP DATABASE prod")
}
```
Use structs to encapsulate the variables and make them available only to those functions that actually need them by making them methods implemented for that struct.  
使用结构体来封装变量，并通过使变量的方法实现该结构体来使变量仅对实际需要它们的函数可用。  

Alternatively higher-order functions can be used to inject dependencies via closures.  
或者，可以使用高阶函数通过闭包注入依赖项方式。

```go
func main() {
	db := // ...
	http.HandleFunc("/drop", DropHandler(db))
	// ...
}

func DropHandler(db *sql.DB) http.HandleFunc {
	return func (w http.ResponseWriter, r *http.Request) {
		db.Exec("DROP DATABASE prod")
	}
}
```

If you really need global variables or constants, e.g., for defining errors or string constants, put them at the top of your file.  
如果确实需要全局变量或常量，例如，用于定义错误或字符串常量，请将其放在文件顶部。
**Don't:**
```go
import "xyz"

func someFunc() {
	//...
}

const route = "/some-route"

func someOtherFunc() {
	// usage of route
}

var NotFoundErr = errors.New("not found")

func yetAnotherFunc() {
	// usage of NotFoundErr
}
```

**Do:**
```go
import "xyz"

const route = "/some-route"

var NotFoundErr = errors.New("not found")

func someFunc() {
	//...
}

func someOtherFunc() {
	// usage of route
}

func yetAnotherFunc() {
	// usage of NotFoundErr
}
```