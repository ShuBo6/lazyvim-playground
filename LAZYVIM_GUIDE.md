# LazyVim 使用指南 - Golang IDE 配置

## 目录
1. [基础概念](#基础概念)
2. [Vim 模式](#vim-模式)
3. [常用快捷键](#常用快捷键)
4. [LazyVim 核心功能](#lazyvim-核心功能)
5. [Golang 开发配置](#golang-开发配置)
6. [实用技巧](#实用技巧)

---

## 基础概念

### Leader 键
- LazyVim 默认 Leader 键是 `<Space>` (空格键)
- Local Leader 键是 `\`

### 什么是 LazyVim
LazyVim 是一个基于 Neovim 的预配置发行版，使用 lazy.nvim 插件管理器，开箱即用。

---

## Vim 模式

### 1. Normal 模式（普通模式）
- 默认模式，用于导航和执行命令
- 按 `Esc` 或 `Ctrl+[` 返回此模式

### 2. Insert 模式（插入模式）
- 用于输入文本
- 进入方式：
  - `i` - 在光标前插入
  - `I` - 在行首插入
  - `a` - 在光标后插入
  - `A` - 在行尾插入
  - `o` - 在下方新建行并插入
  - `O` - 在上方新建行并插入

### 3. Visual 模式（可视模式）
- 用于选择文本
- `v` - 字符可视模式
- `V` - 行可视模式
- `Ctrl+v` - 块可视模式

### 4. Command 模式（命令模式）
- 按 `:` 进入，用于执行 Ex 命令
- 例如：`:w` 保存，`:q` 退出

---

## 常用快捷键

### 基础导航
```
h - 左移
j - 下移
k - 上移
l - 右移

w - 下一个单词开头
b - 上一个单词开头
e - 下一个单词结尾

0 - 行首
^ - 行首（非空白字符）
$ - 行尾

gg - 文件开头
G - 文件结尾
{数字}G - 跳到第几行
Ctrl+u - 上翻半页
Ctrl+d - 下翻半页
Ctrl+b - 上翻一页
Ctrl+f - 下翻一页
```

### 编辑操作
```
x - 删除字符
dd - 删除整行
D - 删除到行尾
dw - 删除单词
d$ - 删除到行尾

yy - 复制整行
yw - 复制单词
p - 粘贴到下方
P - 粘贴到上方

u - 撤销
Ctrl+r - 重做

. - 重复上次操作
```

### 搜索和替换
```
/ - 向下搜索
? - 向上搜索
n - 下一个匹配
N - 上一个匹配

* - 搜索当前单词（向下）
# - 搜索当前单词（向上）

:s/old/new/ - 替换当前行第一个
:s/old/new/g - 替换当前行所有
:%s/old/new/g - 替换全文所有
:%s/old/new/gc - 替换全文所有（需确认）
```

---

## LazyVim 核心功能

### 文件管理（Neo-tree）
```
<Leader>e - 切换文件树
<Leader>E - 在当前文件位置打开文件树

在 Neo-tree 中：
a - 新建文件/文件夹
d - 删除
r - 重命名
x - 剪切
c - 复制
p - 粘贴
q - 关闭
? - 帮助
```

### 模糊搜索（Telescope）
```
<Leader>ff - 查找文件
<Leader>fg - 在文件中搜索（grep）
<Leader>fb - 查找已打开的缓冲区
<Leader>fh - 查找帮助文档
<Leader>fr - 最近文件
<Leader>fw - 搜索当前单词
<Leader>: - 命令历史
<Leader>/ - 在当前缓冲区中搜索

在 Telescope 中：
Ctrl+j/k - 上下移动
Ctrl+n/p - 上下移动
Enter - 选择
Esc - 关闭
Ctrl+c - 关闭
```

### 缓冲区（Buffer）管理
```
<Leader>bb - 切换到其他缓冲区
<Leader>bd - 删除当前缓冲区
[b - 上一个缓冲区
]b - 下一个缓冲区
<Leader>` - 切换到最后一个缓冲区
```

### 窗口（Window）管理
```
<Leader>w - 窗口相关操作（会显示提示）
<Leader>ww - 切换窗口
<Leader>wd - 删除窗口
<Leader>ws - 水平分割
<Leader>wv - 垂直分割
<Leader>- - 水平分割
<Leader>| - 垂直分割

Ctrl+h - 移到左侧窗口
Ctrl+j - 移到下方窗口
Ctrl+k - 移到上方窗口
Ctrl+l - 移到右侧窗口

Ctrl+Up - 增加窗口高度
Ctrl+Down - 减少窗口高度
Ctrl+Left - 减少窗口宽度
Ctrl+Right - 增加窗口宽度
```

### 标签页（Tab）管理
```
<Leader><Tab>l - 最后一个标签页
<Leader><Tab>f - 第一个标签页
<Leader><Tab><Tab> - 新建标签页
<Leader><Tab>] - 下一个标签页
<Leader><Tab>[ - 上一个标签页
<Leader><Tab>d - 关闭标签页
```

### 终端（Terminal）
```
<Leader>ft - 打开浮动终端
<Leader>fT - 打开底部终端
Ctrl+/ - 切换终端

在终端中：
<Esc><Esc> - 进入 Normal 模式
<C-\><C-n> - 进入 Normal 模式
```

### 代码操作（LSP）
```
gd - 跳转到定义
gD - 跳转到声明
gr - 查找引用
gI - 跳转到实现
gy - 跳转到类型定义

K - 显示悬浮文档
Ctrl+k - 显示签名帮助

<Leader>ca - 代码动作
<Leader>cr - 重命名
<Leader>cf - 格式化代码

[d - 上一个诊断
]d - 下一个诊断
<Leader>cd - 行诊断
<Leader>cl - 诊断列表
```

### Git 集成（Gitsigns）
```
<Leader>gg - 打开 LazyGit
<Leader>gb - 查看 Git blame

]h - 下一个 Git hunk
[h - 上一个 Git hunk

<Leader>ghs - Stage hunk
<Leader>ghr - Reset hunk
<Leader>ghS - Stage buffer
<Leader>ghu - Undo stage hunk
<Leader>ghR - Reset buffer
<Leader>ghp - Preview hunk
<Leader>ghb - Blame line
<Leader>ghd - Diff this
```

### 注释
```
gcc - 切换行注释
gbc - 切换块注释
gc{motion} - 注释（配合动作）
gb{motion} - 块注释（配合动作）

在 Visual 模式：
gc - 注释选中内容
gb - 块注释选中内容
```

### 代码折叠
```
za - 切换折叠
zA - 递归切换折叠
zc - 关闭折叠
zC - 递归关闭折叠
zo - 打开折叠
zO - 递归打开折叠
zR - 打开所有折叠
zM - 关闭所有折叠
```

### 通知和消息
```
<Leader>un - 删除所有通知
<Leader>snh - 通知历史
```

### 搜索和导航
```
<Leader>ss - 跳转到符号（当前文件）
<Leader>sS - 跳转到符号（工作区）
<Leader>sd - 文档诊断
<Leader>sD - 工作区诊断
```

---

## Golang 开发配置

### 需要的 LazyVim Extras
在 LazyVim 中启用 Golang 支持，按 `<Leader>l` 打开 Lazy 插件管理器，然后：
1. 按 `x` 进入 extras
2. 找到并启用以下 extras：
   - `lang.go` - Golang 语言支持
   - `formatting.prettier` (可选) - 代码格式化
   - `linting.golangci-lint` (可选) - 代码检查

### Golang LSP 功能
启用 `lang.go` 后，会自动配置：
- **gopls** - Golang 语言服务器
- **go.nvim** - Golang 增强插件

### Golang 特定快捷键
```
<Leader>td - 添加 JSON tags
<Leader>tr - 移除 JSON tags
<Leader>tf - 填充结构体

:GoInstallDeps - 安装 Go 依赖
:GoUpdateDeps - 更新 Go 依赖
:GoTestFunc - 测试当前函数
:GoTestFile - 测试当前文件
:GoTest - 测试当前包
:GoCoverage - 查看测试覆盖率
```

### DAP 调试（需要启用 dap extras）
```
<Leader>db - 切换断点
<Leader>dB - 断点条件
<Leader>dc - 继续
<Leader>dC - 运行到光标处
<Leader>dg - 跳转到行（不执行）
<Leader>di - 步入
<Leader>dj - 下移
<Leader>dk - 上移
<Leader>do - 步出
<Leader>dO - 步过
<Leader>dp - 暂停
<Leader>dr - 切换 REPL
<Leader>ds - 启动调试会话
<Leader>dt - 终止
<Leader>dw - Widgets
```

### Golang 代码片段
LazyVim 集成了 LuaSnip，常用的 Golang 代码片段：
- `fn` - 函数
- `if` - if 语句
- `ife` - if err != nil
- `for` - for 循环
- `forr` - for range
- `struct` - 结构体
- `interface` - 接口
- `switch` - switch 语句
- `test` - 测试函数

### 推荐的外部工具
```bash
# 安装 Golang 工具链
go install golang.org/x/tools/gopls@latest           # LSP 服务器
go install github.com/go-delve/delve/cmd/dlv@latest  # 调试器
go install golang.org/x/tools/cmd/goimports@latest   # 导入管理
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest # Linter

# 安装代码生成工具
go install github.com/fatih/gomodifytags@latest      # Tag 管理
go install github.com/josharian/impl@latest          # 接口实现生成
```

---

## 实用技巧

### 1. 快速跳转
- `f{char}` - 跳到本行下一个字符
- `F{char}` - 跳到本行上一个字符
- `t{char}` - 跳到本行下一个字符之前
- `T{char}` - 跳到本行上一个字符之后
- `;` - 重复上次的 f/t 操作
- `,` - 反向重复上次的 f/t 操作

### 2. 文本对象
```
ci" - 修改引号内内容
ca" - 修改引号及内容
di( - 删除括号内内容
da( - 删除括号及内容
yiw - 复制当前单词
vit - 选中 tag 内内容
```

### 3. 宏录制
```
q{register} - 开始录制到寄存器
q - 停止录制
@{register} - 播放宏
@@ - 重复上次的宏
```

### 4. 标记（Marks）
```
m{a-z} - 设置本地标记
m{A-Z} - 设置全局标记
'{mark} - 跳到标记
`` - 跳回上次位置
```

### 5. 多光标编辑
LazyVim 使用 `mini.nvim` 提供多光标功能：
```
Ctrl+n - 选中当前单词并添加光标
n - 跳过当前并选择下一个
N - 取消当前并选择上一个
q - 跳过当前
Q - 移除当前光标
```

### 6. 快速移动（Flash/Leap）
```
s - 向前跳转
S - 向后跳转
```

### 7. 会话管理
```
<Leader>qs - 恢复会话
<Leader>ql - 恢复最后一个会话
<Leader>qd - 不保存并退出
```

### 8. 配置快速访问
```
<Leader>l - 打开 Lazy 插件管理器
<Leader>: - 命令历史
```

---

## 配置文件位置

LazyVim 配置文件位置：
```
~/.config/nvim/
├── init.lua                 # 主配置文件
├── lua/
│   ├── config/
│   │   ├── autocmds.lua    # 自动命令
│   │   ├── keymaps.lua     # 键位映射
│   │   ├── lazy.lua        # Lazy.nvim 配置
│   │   └── options.lua     # Vim 选项
│   └── plugins/            # 自定义插件配置
│       └── *.lua
```

---

## 学习建议

### 第一周：基础操作
1. 熟练掌握 Normal 模式下的基本移动（h、j、k、l、w、b）
2. 学会进出 Insert 模式（i、a、o、Esc）
3. 练习基本的编辑操作（dd、yy、p、u）
4. 掌握文件保存和退出（:w、:q、:wq）

### 第二周：LazyVim 功能
1. 使用文件树（`<Leader>e`）管理文件
2. 使用 Telescope（`<Leader>ff`）搜索文件
3. 学会分割窗口和在窗口间移动
4. 使用终端功能

### 第三周：Golang 开发
1. 配置 Golang 开发环境
2. 使用 LSP 功能（跳转、重命名、代码提示）
3. 练习调试功能
4. 使用 Git 集成

### 第四周：高级技巧
1. 自定义快捷键
2. 使用宏和文本对象
3. 配置个性化插件
4. 优化工作流程

---

## 常见问题

### 如何查看所有快捷键？
按 `<Leader>?` 或 `:Telescope keymaps`

### 如何安装新插件？
在 `~/.config/nvim/lua/plugins/` 下创建 `.lua` 文件

### 如何更新插件？
打开 Lazy：`<Leader>l`，然后按 `S` 同步更新

### LSP 不工作？
检查语言服务器是否安装：`:Mason`

---

## 资源链接

- [LazyVim 官方文档](https://www.lazyvim.org/)
- [Neovim 文档](https://neovim.io/doc/)
- [Vim 速查表](https://vim.rtorr.com/lang/zh_cn)
- [Golang 官方文档](https://go.dev/doc/)

---

**提示**：使用 `:help {keyword}` 可以查看任何 Vim/Neovim 功能的帮助文档。例如：`:help telescope`
