## Avoid side-effects
## 避免在init出现多余的功能

**Don't:**
```go
func init() {
	someStruct.Load()
}
```

Side effects are only okay in special cases (e.g. parsing flags in a cmd).  If you find no other way, rethink and refactor.  
只有在特殊情况下才可以使用（例如，解析cmd参数）。  如果找不到其他方法，请重新考虑并重构。
