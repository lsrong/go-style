## Consistent header naming
## 统一命名规范
**Don't:**
```go
r.Header.Get("authorization")
w.Header.Set("Content-type")
w.Header.Set("content-type")
w.Header.Set("content-Type")
```

**Do:**
```go
r.Header.Get("Authorization")
w.Header.Set("Content-Type")
```