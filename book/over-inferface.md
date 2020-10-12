## Don't over-interface
## 不要过度定义接口

**Don't:**
```go
type Server interface {
	Serve() error
	Some() int
	Fields() float64
	That() string
	Are([]byte) error
	Not() []string
	Necessary() error
}

func debug(srv Server) {
	fmt.Println(srv.String())
}

func run(srv Server) {
	srv.Serve()
}
```

**Do:**
```go
type Server interface {
	Serve() error
}

func debug(v fmt.Stringer) {
	fmt.Println(v.String())
}

func run(srv Server) {
	srv.Serve()
}
```

Favour small interfaces and only expect the interfaces you need in your funcs.  
推荐使用小接口,仅把您必须要的功能抽象成接口