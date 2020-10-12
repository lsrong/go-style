# Structured logging
## 结构化日志

**Don't:**
```go
log.Printf("Listening on :%d", port)
http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
// 2017/07/29 13:05:50 Listening on :80
```

**Do:**
```go
import "github.com/sirupsen/logrus"
// ...

logger.WithField("port", port).Info("Server is listening")
http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
// {"level":"info","msg":"Server is listening","port":"7000","time":"2017-12-24T13:25:31+01:00"}
```

This is a harmless example, but using structured logging makes debugging and log parsing easier.

这是一个不是必要的操作示例，但是使用结构化日志[sirupsen/logrus](https://github.com/sirupsen/logrus)记录使调试和日志解析更加容易。