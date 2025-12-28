# LazyVim Playground

我的 LazyVim 配置和学习记录仓库，专注于将 LazyVim 打造成一个强大的 Golang IDE。

## 项目简介

这个仓库记录了我使用和配置 LazyVim 的完整过程，包括：
- LazyVim 使用指南和快捷键参考
- Golang 开发环境配置
- 自定义配置和插件
- 学习笔记和使用技巧

## 目录结构

```
.
├── README.md                # 项目说明
├── LAZYVIM_GUIDE.md        # 完整使用指南
├── QUICK_REFERENCE.md      # 快速参考卡片
├── WINDOW_SPLIT_GUIDE.md   # 分屏操作最佳实践
├── BUFFER_GUIDE.md         # Buffer 完全指南
├── GOLANG_SETUP.md         # Golang 环境配置记录
├── SSH_FONT_GUIDE.md       # SSH 场景字体配置指南
├── NERD_FONT_GUIDE.md      # Nerd Font 详细安装指南
├── install-go-tools.sh     # Golang 工具安装脚本
├── install-nerd-font.sh    # Nerd Font 安装脚本（服务器端）
└── examples/               # 示例代码
    ├── hello.go           # Go 示例程序
    └── hello_test.go      # Go 测试示例
```

## 文档说明

### 📖 [LazyVim 使用指南](LAZYVIM_GUIDE.md)
详细的 LazyVim 使用手册，包含：
- Vim 模式详解
- 完整的快捷键列表
- LazyVim 核心功能介绍
- Golang 开发环境配置指南
- 学习路径和资源

### ⚡ [快速参考](QUICK_REFERENCE.md)
精简的速查表，包含：
- 最常用快捷键
- Golang 专用快捷键
- 紧急情况处理
- 配置步骤清单

### 🪟 [分屏操作指南](WINDOW_SPLIT_GUIDE.md)
分屏（窗口管理）的完整指南：
- 创建、切换、调整分屏
- 实用工作流示例
- 最佳实践建议
- 与其他功能配合使用

### 📑 [Buffer 完全指南](BUFFER_GUIDE.md)
Buffer（缓冲区）的完整使用手册：
- Buffer vs Window vs Tab 概念解析
- Buffer 切换、管理、关闭
- bufferline 插件使用
- 实用工作流和最佳实践
- 何时用 Buffer vs 何时用分屏

### 🚀 [Golang 环境配置](GOLANG_SETUP.md)
详细的 Golang 开发环境配置记录，包含：
- 使用 mise 安装 Go
- 配置 Go 代理加速
- LazyVim Golang 插件配置
- 安装 Golang 工具链
- 功能验证和测试
- 常用工作流和故障排除

### 🎨 [SSH 场景字体配置](SSH_FONT_GUIDE.md) ⭐ 推荐
**SSH 远程连接必读！** 解决图标显示问号问题：
- **重要概念**：字体应该装在客户端还是服务器端？
- Windows / macOS / Linux 客户端字体安装
- 各种终端模拟器配置方法
- SSH + UTF-8 配置
- 完整的故障排查指南

### 🎯 [Nerd Font 完整指南](NERD_FONT_GUIDE.md)
Nerd Font 字体的详细安装和配置文档：
- 本地图形界面使用场景
- 多种终端模拟器配置
- 字体推荐和选择
- 常见问题解决

## 快速开始

### 1. 安装 LazyVim

```bash
# 备份现有配置（如果有）
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# 克隆 LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim

# 启动 Neovim
nvim
```

### 2. 配置 Golang 环境

1. 打开 Neovim 并按 `<Space>l` 打开 Lazy 管理器
2. 按 `x` 进入 Extras
3. 找到并启用 `lang.go`
4. 按 `I` 安装插件

### 3. 安装 Golang 工具链

```bash
# LSP 服务器
go install golang.org/x/tools/gopls@latest

# 调试器
go install github.com/go-delve/delve/cmd/dlv@latest

# 导入管理
go install golang.org/x/tools/cmd/goimports@latest

# Linter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# 代码生成工具
go install github.com/fatih/gomodifytags@latest
go install github.com/josharian/impl@latest
```

## 学习路径

### 第一周：基础操作
- [ ] 熟练掌握 Normal 模式下的基本移动
- [ ] 学会进出 Insert 模式
- [ ] 练习基本的编辑操作
- [ ] 掌握文件保存和退出

### 第二周：LazyVim 功能
- [ ] 使用文件树管理文件
- [ ] 使用 Telescope 搜索
- [ ] 学会分割窗口
- [ ] 使用终端功能

### 第三周：Golang 开发
- [ ] 配置 Golang 开发环境
- [ ] 使用 LSP 功能
- [ ] 练习调试功能
- [ ] 使用 Git 集成

### 第四周：高级技巧
- [ ] 自定义快捷键
- [ ] 使用宏和文本对象
- [ ] 配置个性化插件
- [ ] 优化工作流程

## 常用资源

- [LazyVim 官方文档](https://www.lazyvim.org/)
- [Neovim 官方文档](https://neovim.io/doc/)
- [Vim 速查表（中文）](https://vim.rtorr.com/lang/zh_cn)
- [Golang 官方文档](https://go.dev/doc/)

## 个人笔记

### 最有用的快捷键（个人总结）

| 快捷键 | 功能 | 使用频率 |
|--------|------|----------|
| `<Space>ff` | 查找文件 | ⭐⭐⭐⭐⭐ |
| `<Space>fg` | 全局搜索 | ⭐⭐⭐⭐⭐ |
| `gd` | 跳转到定义 | ⭐⭐⭐⭐⭐ |
| `<Space>e` | 文件树 | ⭐⭐⭐⭐ |
| `<Space>ca` | 代码操作 | ⭐⭐⭐⭐ |

### 学习心得

*（在这里记录你的学习心得和技巧）*

## 贡献

这是我的个人学习仓库，欢迎提出建议和改进意见！

## License

MIT

---

**最后更新：** 2025-12-27
**作者：** ShuBo6
