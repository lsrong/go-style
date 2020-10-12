## Use an assert libary
## 尽量使用断言库
**Don't:**
```go
func TestAdd(t *testing.T) {
	actual := 2 + 2
	expected := 4
	if (actual != expected) {
		t.Errorf("Expected %d, but got %d", expected, actual)
	}
}
```

**Do:**
```go
import "github.com/stretchr/testify/assert"

func TestAdd(t *testing.T) {
	actual := 2 + 2
	expected := 4
	assert.Equal(t, expected, actual)
}
```

Using assert libraries makes your tests more readable, requires less code and provides consistent error output.  
使用断言库[stretchr/testify](https://github.com/stretchr/testify)可以使您的测试更具可读性，所需的代码更少，并提供一致的错误输出。

## Use sub-tests to structure functional tests
## 使用子测试来构建功能测试
**Don't:**
```go
func TestSomeFunctionSuccess(t *testing.T) {
	// ...
}

func TestSomeFunctionWrongInput(t *testing.T) {
	// ...
}
```

**Do:**
```go
func TestSomeFunction(t *testing.T) {
	t.Run("success", func(t *testing.T){
		//...
	})

	t.Run("wrong input", func(t *testing.T){
		//...
	})
}
```

## Use table driven tests
## 使用表驱动测试 [TableDrivenTests](https://github.com/golang/go/wiki/TableDrivenTests)

**Don't:**
```go
func TestAdd(t *testing.T) {
	assert.Equal(t, 1+1, 2)
	assert.Equal(t, 1+-1, 0)
	assert.Equal(t, 1, 0, 1)
	assert.Equal(t, 0, 0, 0)
}
```

The above approach looks simpler, but it's much harder to find a failing case,especially when having hundreds of cases.  
上面的方法看起来更简单，但是要找到失败的案例要困难得多，尤其是在有数百个案例的情况下。

**Do:**
```go
func TestAdd(t *testing.T) {
	cases := []struct {
		A, B, Expected int
	}{
		{1, 1, 2},
		{1, -1, 0},
		{1, 0, 1},
		{0, 0, 0},
	}

	for _, tc := range cases {
		t.Run(fmt.Sprintf("%d + %d", tc.A, tc.B), func(t *testing.T) {
			t.Parallel()
			assert.Equal(t, t.Expected, tc.A+tc.B)
		})
	}
}
```

Using table driven tests in combination with subtests gives you direct insight about which case is failing and which cases are tested.
– [Mitchell Hashimoto at GopherCon 2017](https://youtu.be/8hQG7QlcLBk?t=7m34s)  
将表驱动的测试与子测试结合使用，可以使您直接了解哪个案例失败以及哪个案例进行了测试。

Running subtests in parallel allows you to have a lot more test cases and still get those awesomely fast go build times.
– [The Go Blog](https://blog.golang.org/subtests)  
并行运行子测试可以使您拥有更多的测试用例，并且仍然可以快速完成构建。

## Avoid mocks
## 避免使用 [mock](https://github.com/golang/mock)

**Don't:**
```go
func TestRun(t *testing.T) {
	mockConn := new(MockConn)
	run(mockConn)
}
```

**Do:**
```go
func TestRun(t *testing.T) {
	ln, err := net.Listen("tcp", "127.0.0.1:0")
	t.AssertNil(t, err)

	var server net.Conn
	go func() {
		defer ln.Close()
		server, err := ln.Accept()
		t.AssertNil(t, err)
	}()

	client, err := net.Dial("tcp", ln.Addr().String())
	t.AssertNil(err)

	run(client)
}
```

Only use mocks if not otherwise possible, favor real implementations.
– [Mitchell Hashimoto at GopherCon 2017](https://youtu.be/8hQG7QlcLBk?t=26m51s)  
仅在没有其他可能的情况下才使用模拟，而是支持实际实现。

## Avoid DeepEqual
## 避免使用 DeepEqual

**Don't:**
```go
type myType struct {
	id         int
	name       string
	irrelevant []byte
}

func TestSomething(t *testing.T) {
	actual := &myType{/* ... */}
	expected := &myType{/* ... */}
	assert.True(t, reflect.DeepEqual(expected, actual))
}
```

**Do:**
```go
type myType struct {
	id         int
	name       string
	irrelevant []byte
}

func (m *myType) testString() string {
	return fmt.Sprintf("%d.%s", m.id, m.name)
}

func TestSomething(t *testing.T) {
	actual := &myType{/* ... */}
	expected := &myType{/* ... */}
	if actual.testString() != expected.testString() {
		t.Errorf("Expected '%s', got '%s'", expected.testString(), actual.testString())
	}
	// or assert.Equal(t, actual.testString(), expected.testString())
}
```

Using `testString()` for comparing structs helps on complex structs with many fields that are not relevant for the equality check.
This approach only makes sense for very big or tree-like structs.
– [Mitchell Hashimoto at GopherCon 2017](https://youtu.be/8hQG7QlcLBk?t=30m45s)  
使用`testString（）`有助于比较复杂的结构体，其中许多字段与相等性检查无关。
这种方法仅对非常大或类似树的结构有意义

Google open sourced their [go-cmp](http://github.com/google/go-cmp) package as a more powerful and safer alternative to `reflect.DeepEqual`.  
Google开源了他们的[go-cmp](http://github.com/google/go-cmp)软件包，它是`reflect.DeepEqual`的更强大，更安全的替代品。
– [Joe Tsai](https://twitter.com/francesc/status/885630175668346880).

## Avoid testing unexported funcs
## 避免测试未导出的函数

Only test unexported funcs if you can't access a path via exported funcs.  
Since they are unexported, they are prone to change.  
如果您无法通过导出的函数访问路径，则仅测试未导出的函数。
由于它们是未导出的，因此容易发生变化

## Add examples to your test files to demonstrate usage
## 在测试文件中添加示例以演示用法
```go
func ExamleSomeInterface_SomeMethod(){
	instance := New()
	result, err := instance.SomeMethod()
	fmt.Println(result, err)
	// Output: someResult, <nil>
}
```