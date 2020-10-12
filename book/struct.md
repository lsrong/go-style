## Structs
### Use named structs
### 命名结构体
If a struct has more than one field include field names when instantiating it.  
如果结构具有多个字段，则在实例化它时包括字段名称。

**Don't:**
```go
params := myStruct{
	1, 
	true,
}
```

**Do:**
```go
params := myStruct{
	Foo: 1,
	Bar: true,
}
```

### Avoid new keyword
### 尽量不用new关键字
Using the normal syntax instead of the `new` keyword makes it more clear what is happening: a new instance of the struct is created `MyStruct{}` and we get the pointer for it with `&`.  
使用普通语法而不是`new`关键字可以更清楚地了解正在发生的事情：创建了该结构的新实例`MyStruct {}`，然后使用`＆`获得了它的指针。  
**Don't:**
```go
s := new(MyStruct)
```

**Do:**
```go
s := &MyStruct{}
```
