## Use linters
## 静态代码检测工具

Use all the linters included in [golangci-lint](https://github.com/golangci/golangci-lint) to lint your projects before committing.  
在提交之前，建议使用[golangci-lint](https://github.com/golangci/golangci-lint)对编写的项目进行检测

```bash
# Installation - replace vX.X.X with the version you want to use
GO111MODULE=on go get github.com/golangci/golangci-lint/cmd/golangci-lint@vX.X.X
# traditional way without go module
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint


# Usage in the project workspace
golangci-lint run
```
For detailed usage and the ci-pipeline installation guide visit [golangci-lint](https://github.com/golangci/golangci-lint).  
详细用法和ci-pipeline安装指南，请访问[golangci-lint](https://github.com/golangci/golangci-lint)。