## Use functional options
## 函数式选项

```go

func main() {
	// ...
	startServer(
		WithPort(8080),
		WithTimeout(1 * time.Second),
	)
}

type Config struct {
	port    int
	timeout time.Duration
}

type ServerOpt func(*Config)

func WithPort(port int) ServerOpt {
	return func(cfg *Config) {
		cfg.port = port
	}
}

func WithTimeout(timeout time.Duration) ServerOpt {
	return func(cfg *Config) {
		cfg.timeout = timeout
	}
}

func startServer(opts ...ServerOpt) {
	cfg := new(Config)
	for _, fn := range opts {
		fn(cfg)
	}

	// ...
}
```

In case we do want to give the user extensibility, we can always provide arguments to our option constructor.  
如果我们确实希望提供用户可扩展性，则可以始终为选项构造函数提供参数。

When using functional options, the order of the options doesn’t matter. This gives us a lot of flexibility when compared to regular function arguments (which have to be in the correct order).    
使用功能选项时，选项的顺序无关紧要。与常规函数参数（必须按正确的顺序）相比，这为我们提供了很大的灵活性。





