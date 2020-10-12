## Avoid unadorned return
## 避免未修饰的返回

**Don't:**
```go
func run() (n int, err error) {
	// ...
	return
}
```

**Do:**
```go
func run() (n int, err error) {
	// ...
	return n, err
}
```

Named returns are good for documentation, unadorned returns are bad for readability and error-prone.  
命名返回对阅读代码是很有帮助的，未修饰的返回不利于项目代码的可读性和易出错性。