## Divide imports
## 分类导入软件包

**Don't:**
```go
import (
	"encoding/json"
	"github.com/some/external/pkg"
	"fmt"
	"github.com/this-project/pkg/some-lib"
	"os"
)
```

**Do:**
```go
import (
	"encoding/json"
	"fmt"
	"os"

	"github.com/bahlo/this-project/pkg/some-lib"

	"github.com/bahlo/another-project/pkg/some-lib"
	"github.com/bahlo/yet-another-project/pkg/some-lib"

	"github.com/some/external/pkg"
	"github.com/some-other/external/pkg"
)
```

Divide imports into four groups sorted from internal to external for readability:
1. Standard library
2. Project internal packages
3. Company internal packages
4. External packages

为了便于阅读，将导入内容分为四类，从内部到外部分为以下几类：
1. 标准库
2. 项目内部包
3. 公司内部包装
4. 外部包装
