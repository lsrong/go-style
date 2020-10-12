# Add context to errors
## 为错误添加上下文
**Don't:**

```go
file, err := os.Open("foo.txt")
if err != nil {
	return err
}
```

Using the approach above can lead to unclear error messages because of missing context.

使用上述方法可能会由于丢失而导致不清楚的错误消息语境

**Do:**

```go
file, err := os.Open("foo.txt")
if err != nil {
	return fmt.Errorf("open foo.txt failed: %w", err)
}
```

Wrapping errors with a custom message provides context as it gets propagated up the stack.
This does not always make sense.
If you're unsure if the context of a returned error is at all times sufficient, wrap it.

用自定义消息包装错误会在上下文向上传播时提供上下文。 这并不总是有意义。 如果您不确定返回的错误的上下文是否始终足够，请包装它