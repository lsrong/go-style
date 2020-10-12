# Dependency management
## 依赖管理

### Use modules
Use [modules](https://github.com/golang/go/wiki/Modules), since it is the built-in go dependency 
management tooling and will be widely supported (available with Go 1.11+).

使用[modules](https://github.com/golang/go/wiki/Modules)，因为它是内置的go依赖关系管理工具，将得到广泛支持（Go 1.11+提供）。

### Use Semantic Versioning 
### 使用语义版本控制
Tag your packages using [Semantic Versioning](http://semver.org), check the [modules wiki](https://github.com/golang/go/wiki/Modules#how-to-prepare-for-a-release) for more information about
best practices regarding releases.
The git tag for your go package should have the format `v<major>.<minor>.<patch>`, e.g., `v1.0.1`.

使用语义版本控制标记软件包[Semantic Versioning](http://semver.org)，请查看[modules wiki](https://github.com/golang/go/wiki/Modules#how-to-prepare-for-a-release) ，以获取有关发行版最佳实践的更多信息。 go软件包的git标签的格式应为v <major>。<minor>。<patch>，例如v1.0.1