## Use canonical import path
## 使用规范的导入路径

**Don't:**
```go
package sub
```

**Do:**
```go
package sub // import "github.com/my-package/pkg/sth/else/sub"
```

Adding the canonical import path adds context to the package and makes importing easy.  
添加规范的导入路径将上下文添加到包中，并使导入变得容易。

## Avoid empty interface
## 避免使用空接口

**Don't:**
```go
func run(foo interface{}) {
	// ...
}
```

Empty interfaces make code more complex and unclear, avoid them where you can.  
空接口会使代码更加复杂和不清楚，请尽可能避免使用它们。

## Avoid helper/util
## 避免命名helper/util

Use clear names and try to avoid creating a `helper.go`, `utils.go` or even package.  
使用清晰的名称，并尝试避免创建`helper.go`，`utils.go`甚至程序包。

## Embed binary data
## 嵌入二进制数据

To enable single-binary deployments, use tools to add templates and other static assets to your binary
(e.g. [github.com/gobuffalo/packr](https://github.com/gobuffalo/packr)).  
要启用单二进制部署，请使用工具将模板和其他静态资产添加到二进制文件中