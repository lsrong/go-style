## Use `io.WriteString`
## 推荐使用`io.WriteString`
A number of important types that satisfy `io.Writer` also have a `WriteString`method, 
including `*bytes.Buffer`, `*os.File` and `*bufio.Writer`. `WriteString` is behavioral contract with implicit assent that passed string will be written in efficient way, without a temporary allocation. 
Therefore using `io.WriteString` may improve performance at most, and at least string will be written in any way.  

满足io.Writer的许多重要类型也有WriteString方法，
包括* bytes.Buffer，* os.File和* bufio.Writer。 “ WriteString”是具有隐式同意的行为协定，
所传递的字符串将以有效的方式写入，而无需临时分配。
因此，使用io.WriteString最多可以提高性能，并且至少可以以任何方式写入字符串。

**Don't:**
```go
var w io.Writer = new(bytes.Buffer)
str := "some string"
w.Write([]byte(str))
```

**Do:**
```go
var w io.Writer = new(bytes.Buffer)
str := "some string"
io.WriteString(w, str)
```