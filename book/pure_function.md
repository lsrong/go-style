## Favour pure functions
## 推荐使用纯函数

> In computer programming, a function may be considered a pure function if both of the following statements about the function hold:
> 1. The function always evaluates the same result value given the same argument value(s). The function result value cannot depend on any hidden information or state that may change while program execution proceeds or between different executions of the program, nor can it depend on any external input from I/O devices.
> 2. Evaluation of the result does not cause any semantically observable side effect or output, such as mutation of mutable objects or output to I/O devices.  
– [Wikipedia](https://en.wikipedia.org/wiki/Pure_function)

> 在计算机编程中，如果以下有关该函数的两个陈述均成立，则该函数可以视为纯函数:
> 1. 给定相同的参数值，该函数始终求值相同的结果值。函数结果值不能取决于在程序执行过程中或在程序的不同执行之间可能更改的任何隐藏信息或状态，也不能取决于I/O设备的任何外部输入
> 2. 结果评估不会引起任何语义上可观察到的副作用或输出，例如可变对象的突变或输出到I/O设备。


**Don't:**
```go
func MarshalAndWrite(some *Thing) error {
	b, err := json.Marshal(some)
	if err != nil {
		return err
	}

	return ioutil.WriteFile("some.thing", b, 0644)
}
```

**Do:**
```go
// Marshal is a pure func (even though useless)
func Marshal(some *Thing) ([]bytes, error) {
	return json.Marshal(some)
}

// ...
```

This is obviously not possible at all times, but trying to make every possible func pure makes code more understandable and improves debugging.  
这显然不可能一直都存在，但是尝试使每一个功能都变得纯净，会使代码更易于理解，并改善了调试。
