## Handle signals
## 使用处理信号 [signal](https://golang.org/pkg/os/signal/)

**Don't:**
```go
func main() {
	for {
		time.Sleep(1 * time.Second)
		ioutil.WriteFile("foo", []byte("bar"), 0644)
	}
}
```

**Do:**
```go
func main() {
	logger := // ...
	sc := make(chan os.Signal, 1)
	done := make(chan bool)

	go func() {
		for {
			select {
			case s := <-sc:
				logger.Info("Received signal, stopping application",
					zap.String("signal", s.String()))
				done <- true
				return
			default:
				time.Sleep(1 * time.Second)
				ioutil.WriteFile("foo", []byte("bar"), 0644)
			}
		}
	}()

	signal.Notify(sc, os.Interrupt, os.Kill)
	<-done // Wait for go-routine
}
```

Handling signals allows us to gracefully stop our server, close open files and connections and therefore prevent file corruption among other things.  
处理信号使我们能够优雅地停止服务器，关闭打开的文件和连接，从而防止文件损坏。