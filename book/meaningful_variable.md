## Use meaningful variable names
## 使用语义化的变量名称
Avoid single-letter variable names. They may seem more readable to you at the moment of writing but they make the code hard to understand for your colleagues and your future self.  
避免使用单字母变量名称。在编码过程时，它们似乎对您更具可读性，但它们会使您的同事和未来的您难以理解代码。  
**Don't:**
```go
func findMax(l []int) int {
	m := l[0]
	for _, n := range l {
		if n > m {
			m = n
		}
	}
	return m
}
```

**Do:**
```go
func findMax(inputs []int) int {
	max := inputs[0]
	for _, value := range inputs {
		if value > max {
			max = value
		}
	}
	return max
}
```
Single-letter variable names are fine in the following cases.  
* They are absolute standard like ...
	* `t` in tests
	* `r` and `w` in http request handlers
	* `i` for the index in a loop
* They name the receiver of a method, e.g., `func (s *someStruct) myFunction(){}`

Of course also too long variables names like `createInstanceOfMyStructFromString` should be avoided.

在以下情况下，单字母变量名可以使用。 
* 标准化情况，如...
    * `t` in tests
    * `r` and `w` in http request handlers
    * `i` for the index in a loop
* 命名方法的接收者,e.g., `func (s *someStruct) myFunction(){}`  

当然，也应该避免使用太长的变量名，例如`createInstanceOfMyStructFromString`。


