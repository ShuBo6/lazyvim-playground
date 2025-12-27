# Golang 开发环境配置记录

本文档记录了为 LazyVim 配置 Golang 开发环境的完整过程。

## 配置日期
2025-12-27

## 1. 环境准备

### 1.1 安装 Go
使用 mise 管理 Go 版本：

```bash
# 安装最新版 Go
mise use -g go@latest

# 验证安装
mise exec -- go version
# 输出：go version go1.25.5 linux/amd64
```

### 1.2 配置 Go 代理（国内加速）

```bash
# 设置 GOPROXY
mise exec -- go env -w GOPROXY=https://goproxy.cn,direct

# 设置 GOSUMDB
mise exec -- go env -w GOSUMDB=sum.golang.google.cn

# 验证配置
mise exec -- go env | grep -E "GOPROXY|GOSUMDB"
```

## 2. LazyVim 配置

### 2.1 创建 Golang 插件配置

创建文件：`~/.config/nvim/lua/plugins/go.lua`

配置内容包括：
- 导入 LazyVim 的 Go extras (`lazyvim.plugins.extras.lang.go`)
- 配置 Tree-sitter 支持 Go 语法高亮
- 配置 gopls LSP 服务器
- 配置 Neotest 测试支持
- 配置 DAP 调试支持

关键配置：
```lua
-- gopls 配置
gopls = {
  gofumpt = true,                    -- 使用 gofumpt 格式化
  codelenses = { ... },              -- 代码透镜功能
  hints = { ... },                   -- 内联提示
  analyses = { ... },                -- 静态分析
  completeUnimported = true,         -- 自动补全未导入的包
  staticcheck = true,                -- 启用 staticcheck
}
```

## 3. 安装 Golang 工具链

### 3.1 创建安装脚本

创建了 `install-go-tools.sh` 脚本，安装以下工具：

| 工具 | 用途 |
|------|------|
| gopls | Go 语言服务器（LSP） |
| delve | Go 调试器 |
| goimports | 导入管理和格式化 |
| golangci-lint | 代码检查工具 |
| gomodifytags | 结构体标签管理 |
| impl | 接口实现生成器 |
| gotests | 测试代码生成器 |
| staticcheck | 静态分析工具 |
| gofumpt | 更严格的代码格式化工具 |

### 3.2 执行安装

```bash
chmod +x install-go-tools.sh
bash install-go-tools.sh
```

所有工具都会安装到 `~/go/bin/` 目录（通过 mise 的 Go 环境）。

## 4. 验证配置

### 4.1 创建测试项目

在 `examples/` 目录下创建了测试文件：
- `hello.go` - 主程序
- `hello_test.go` - 测试文件

### 4.2 运行测试

```bash
cd examples
mise exec -- go mod init example.com/hello
mise exec -- go test -v
mise exec -- go run hello.go
```

测试结果：
```
✅ 所有测试通过
✅ 程序运行正常
```

## 5. LazyVim 中的 Golang 功能

### 5.1 代码导航
| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gr` | 查找引用 |
| `gI` | 跳转到实现 |
| `gy` | 跳转到类型定义 |
| `K` | 显示悬浮文档 |

### 5.2 代码操作
| 快捷键 | 功能 |
|--------|------|
| `<Space>ca` | 代码动作（Code Action） |
| `<Space>cr` | 重命名符号 |
| `<Space>cf` | 格式化代码 |

### 5.3 测试相关
| 命令 | 功能 |
|------|------|
| `:GoTestFunc` | 测试当前函数 |
| `:GoTestFile` | 测试当前文件 |
| `:GoTest` | 测试当前包 |
| `:GoCoverage` | 查看测试覆盖率 |

### 5.4 调试功能
| 快捷键 | 功能 |
|--------|------|
| `<Space>db` | 切换断点 |
| `<Space>dc` | 继续执行 |
| `<Space>di` | 步入 |
| `<Space>do` | 步出 |
| `<Space>dO` | 步过 |

### 5.5 代码生成
| 快捷键 | 功能 |
|--------|------|
| `<Space>td` | 添加 JSON tags |
| `<Space>tr` | 移除 JSON tags |
| `<Space>tf` | 填充结构体 |

## 6. 常用工作流

### 6.1 开发新项目

```bash
# 1. 创建项目目录
mkdir my-project && cd my-project

# 2. 初始化 Go 模块
mise exec -- go mod init github.com/username/my-project

# 3. 用 LazyVim 打开
nvim main.go
```

### 6.2 在 LazyVim 中开发

1. **编写代码**：享受自动补全、实时诊断、导入管理
2. **格式化**：保存时自动格式化（通过 gopls + gofumpt）
3. **运行测试**：使用 `:GoTest` 或 Neotest
4. **调试**：设置断点，使用 DAP 调试
5. **查找引用**：`gr` 查看函数/变量的所有使用位置

### 6.3 使用 LSP 功能

```
打开 .go 文件后：
1. 输入代码时会自动补全
2. 悬停在符号上按 K 查看文档
3. 按 gd 跳转到定义
4. 按 <Space>ca 查看可用的代码操作
5. 保存时自动格式化和组织导入
```

## 7. 故障排除

### 7.1 LSP 不工作

检查 gopls 是否安装：
```bash
mise exec -- which gopls
```

在 LazyVim 中检查 LSP 状态：
```vim
:LspInfo
```

### 7.2 导入速度慢

确认已配置 GOPROXY：
```bash
mise exec -- go env GOPROXY
# 应该输出：https://goproxy.cn,direct
```

### 7.3 调试器不工作

检查 delve 是否安装：
```bash
mise exec -- which dlv
```

### 7.4 格式化不符合预期

检查 gopls 配置中的 `gofumpt` 选项是否启用。

## 8. 下一步

### 8.1 推荐的额外插件

- `dap` extras：调试支持
- `test` extras：增强的测试支持
- `linting` extras：额外的 lint 工具

启用方法：
1. 按 `<Space>l` 打开 Lazy
2. 按 `x` 进入 extras
3. 找到并启用相应的 extras

### 8.2 进一步学习

- 熟悉 gopls 的所有代码操作
- 学习使用 DAP 调试复杂应用
- 探索 Neotest 的测试工作流
- 自定义快捷键和配置

## 9. 参考资源

- [LazyVim 官方文档](https://www.lazyvim.org/)
- [gopls 文档](https://pkg.go.dev/golang.org/x/tools/gopls)
- [delve 调试器](https://github.com/go-delve/delve)
- [Go 官方文档](https://go.dev/doc/)

---

**配置完成！现在你可以开始使用 LazyVim 进行 Golang 开发了！** 🎉
