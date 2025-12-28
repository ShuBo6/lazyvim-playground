# LazyVim Buffer 完全指南

本文档详细介绍 LazyVim 中 Buffer（缓冲区）的概念和使用方法。

## 核心概念

### Buffer vs Window vs Tab

理解这三个概念是掌握 Vim 的关键：

```
┌─────────────────────────────────────────────────────────┐
│ Tab（标签页）                                            │
│  ┌─────────────────────┬─────────────────────┐          │
│  │ Window（窗口）       │ Window（窗口）       │          │
│  │                     │                     │          │
│  │  显示 Buffer A      │  显示 Buffer B      │          │
│  │  (main.go)          │  (test.go)          │          │
│  │                     │                     │          │
│  └─────────────────────┴─────────────────────┘          │
└─────────────────────────────────────────────────────────┘

后台还有：Buffer C (utils.go)、Buffer D (config.go)...
```

| 概念 | 说明 | 类比 |
|------|------|------|
| **Buffer** | 加载到内存中的文件 | 打开的文档 |
| **Window** | 显示 Buffer 的视口 | 文档的视图窗口 |
| **Tab** | 窗口的集合 | 工作区/桌面 |

**关键理解**：
- 一个 Buffer 可以在多个 Window 中显示
- 一个 Window 只能显示一个 Buffer
- Buffer 关闭 ≠ 文件关闭（Buffer 可以在后台）
- 关闭 Window 不会关闭 Buffer

### 为什么要用 Buffer？

1. **比分屏更轻量**：不占用屏幕空间
2. **快速切换**：在多个文件间跳转
3. **保持上下文**：光标位置、撤销历史都保留
4. **节省内存**：比开多个 Vim 实例更高效

## 1. 打开 Buffer

### 在当前窗口打开文件

```vim
:e filename       " 编辑文件（Edit）
:e path/to/file   " 编辑指定路径的文件
:e .              " 打开文件浏览器
```

### 使用 Telescope 打开（推荐）

| 快捷键 | 说明 |
|--------|------|
| `<Space>ff` | 查找并打开文件 |
| `<Space>fr` | 打开最近的文件 |
| `<Space>fb` | 在已打开的 Buffer 中选择 |
| `<Space><Space>` | 查找文件（根目录） |

### 使用 Neo-tree 打开

```
<Space>e     打开文件树
Enter        在当前窗口打开文件（新 Buffer）
```

## 2. 切换 Buffer

### LazyVim 默认快捷键（最常用）

| 快捷键 | 说明 |
|--------|------|
| `<Space>bb` | **Buffer 选择器**（Telescope，推荐） |
| `<Space>,` | 切换到其他 Buffer（同上） |
| `[b` | 上一个 Buffer |
| `]b` | 下一个 Buffer |
| `<Space>`` ` | 切换到最后使用的 Buffer（来回切换） |

### Tab 键快速切换（bufferline）

LazyVim 默认启用 bufferline 插件，顶部会显示 Buffer 标签：

| 快捷键 | 说明 |
|--------|------|
| `<S-h>` (Shift+H) | 上一个 Buffer |
| `<S-l>` (Shift+L) | 下一个 Buffer |

### 按编号切换

```vim
:b1       " 切换到 Buffer 1
:b2       " 切换到 Buffer 2
:b#       " 切换到上一个 Buffer（交替切换）
```

### 按名称切换

```vim
:b main       " 切换到文件名包含 'main' 的 Buffer
:b test.go    " 切换到 test.go
```

支持 Tab 补全，输入部分名称后按 Tab 会自动补全。

## 3. 查看 Buffer 列表

### 使用 Telescope（推荐）

```
<Space>bb    打开 Buffer 选择器
```

在 Telescope 中：
- `Enter` - 切换到选中的 Buffer
- `Ctrl+d` - 删除选中的 Buffer
- 输入文字过滤 Buffer

### 使用命令

```vim
:ls           " 列出所有 Buffer
:buffers      " 同上
:files        " 同上
```

Buffer 列表示例：
```
  1 %a   "main.go"              line 42
  2 #    "test.go"              line 1
  3      "utils.go"             line 15
  4 +    "config.go"            line 8
```

标记说明：
| 标记 | 说明 |
|------|------|
| `%` | 当前窗口显示的 Buffer |
| `#` | 上一个访问的 Buffer（可用 `:b#` 切换） |
| `a` | 活动的（在某个窗口中显示） |
| `+` | 已修改未保存 |
| `-` | 不可修改 |
| `=` | 只读 |

## 4. 关闭 Buffer

### LazyVim 快捷键

| 快捷键 | 说明 |
|--------|------|
| `<Space>bd` | 关闭当前 Buffer（Buffer Delete） |
| `<Space>bD` | 强制关闭（不保存） |
| `<Space>bo` | 关闭其他所有 Buffer（Buffer Only） |

### 命令方式

```vim
:bd           " 关闭当前 Buffer（Buffer Delete）
:bd!          " 强制关闭（不保存修改）
:bd 3         " 关闭 Buffer 3
:bd file.go   " 关闭指定文件的 Buffer

" 批量关闭
:bd 1 2 3     " 关闭 Buffer 1、2、3
:%bd          " 关闭所有 Buffer
:1,3bd        " 关闭 Buffer 1 到 3
```

### 关闭并保存

```vim
:w | bd       " 保存后关闭
```

## 5. Buffer 操作进阶

### 保存 Buffer

| 快捷键/命令 | 说明 |
|-------------|------|
| `:w` | 保存当前 Buffer |
| `:wa` | 保存所有 Buffer |
| `:wall` | 同上 |
| `Ctrl+s` | 保存（LazyVim 默认映射） |

### 在所有 Buffer 中执行命令

```vim
:bufdo %s/foo/bar/g     " 在所有 Buffer 中替换
:bufdo w                " 保存所有 Buffer
:bufdo e!               " 重新加载所有 Buffer
```

### Buffer 导航历史

```vim
Ctrl+o    " 跳转到上一个位置（可跨 Buffer）
Ctrl+i    " 跳转到下一个位置（可跨 Buffer）
```

这两个是**跳转历史**，不仅在 Buffer 间跳转，还能回到之前的光标位置。

### 在新窗口中打开 Buffer

```vim
:sb 3         " 水平分屏打开 Buffer 3
:vert sb 3    " 垂直分屏打开 Buffer 3
:tab sb 3     " 新标签页打开 Buffer 3
```

## 6. 实用工作流

### 场景1：多文件编辑

```
1. <Space>ff          查找并打开第一个文件
2. <Space>ff          查找并打开第二个文件
3. <Space>ff          查找并打开第三个文件
4. <Space>bb          查看所有打开的文件，选择切换
5. [b / ]b            快速在相邻文件间切换
6. <Space>`           在两个文件间来回切换
```

### 场景2：代码和测试切换

```
假设打开了 main.go 和 main_test.go：

<Space>`      快速在代码和测试间切换
<Space>bb     选择特定文件
```

### 场景3：批量修改多文件

```
1. 打开所有需要修改的文件
2. :bufdo %s/oldName/newName/g    在所有文件中替换
3. :wa                             保存所有文件
```

### 场景4：清理工作区

```
<Space>bo     只保留当前 Buffer，关闭其他所有
```

### 场景5：恢复误关的 Buffer

```
<Space>fr     打开最近文件列表，找回关闭的文件
```

### 场景6：在定义和调用间跳转

```
1. 在函数调用处按 gd 跳转到定义
2. 编辑完成后按 Ctrl+o 返回调用处
3. 不需要手动切换 Buffer，跳转历史自动处理
```

## 7. Buffer vs 分屏：何时用哪个？

### 使用 Buffer 的场景

- ✅ 频繁在多个文件间切换
- ✅ 文件数量较多（>3个）
- ✅ 不需要同时查看多个文件
- ✅ 想保持屏幕整洁

### 使用分屏的场景

- ✅ 需要同时对比两个文件
- ✅ 边看文档边写代码
- ✅ 代码和测试需要同时可见
- ✅ 只涉及 2-3 个文件

### 最佳实践

**Buffer + 分屏 结合使用**：

```
┌─────────────────────┬─────────────────────┐
│ Window 1            │ Window 2            │
│ 可以切换多个 Buffer  │ 可以切换多个 Buffer  │
│ (main.go ↔ utils.go)│ (test.go ↔ mock.go) │
└─────────────────────┴─────────────────────┘
```

每个窗口都可以独立切换 Buffer，这样既有分屏的对比能力，又有 Buffer 的灵活切换。

## 8. bufferline 插件

LazyVim 默认使用 bufferline 插件在顶部显示 Buffer 标签。

### bufferline 快捷键

| 快捷键 | 说明 |
|--------|------|
| `<S-h>` | 切换到左边的 Buffer |
| `<S-l>` | 切换到右边的 Buffer |
| `<Space>bp` | Pin Buffer（固定） |
| `<Space>bP` | 删除非 Pin 的 Buffer |

### 鼠标操作

如果启用了鼠标（LazyVim 默认启用）：
- 左键点击标签：切换到该 Buffer
- 中键点击标签：关闭该 Buffer

### 隐藏/显示 bufferline

如果觉得 bufferline 太占空间：

```lua
-- ~/.config/nvim/lua/plugins/ui.lua
return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,  -- 禁用 bufferline
  },
}
```

或者只是临时隐藏：
```vim
:set showtabline=0    " 隐藏
:set showtabline=2    " 显示
```

## 9. 快捷键速查表

### Buffer 切换

| 快捷键 | 说明 |
|--------|------|
| `<Space>bb` | Buffer 选择器（Telescope） |
| `<Space>,` | 同上 |
| `<Space>`` ` | 切换到上一个 Buffer |
| `[b` | 上一个 Buffer |
| `]b` | 下一个 Buffer |
| `<S-h>` | 上一个 Buffer（bufferline） |
| `<S-l>` | 下一个 Buffer（bufferline） |

### Buffer 管理

| 快捷键 | 说明 |
|--------|------|
| `<Space>bd` | 关闭当前 Buffer |
| `<Space>bD` | 强制关闭 |
| `<Space>bo` | 关闭其他 Buffer |
| `<Space>bp` | 固定 Buffer |

### 文件打开

| 快捷键 | 说明 |
|--------|------|
| `<Space>ff` | 查找文件 |
| `<Space>fr` | 最近文件 |
| `<Space>e` | 文件树 |

### 跳转历史

| 快捷键 | 说明 |
|--------|------|
| `Ctrl+o` | 后退（跨 Buffer） |
| `Ctrl+i` | 前进（跨 Buffer） |

## 10. 常用命令速查

```vim
" 查看 Buffer
:ls                   列出所有 Buffer
:buffers              同上

" 切换 Buffer
:b {name}             按名称切换
:b {num}              按编号切换
:b#                   切换到上一个
:bn                   下一个 Buffer
:bp                   上一个 Buffer

" 关闭 Buffer
:bd                   关闭当前
:bd {num}             关闭指定编号
:bd!                  强制关闭
:%bd                  关闭所有

" 保存
:w                    保存当前
:wa                   保存所有

" 批量操作
:bufdo {cmd}          在所有 Buffer 执行命令
```

## 11. 高级技巧

### 使用 marks 在 Buffer 间标记位置

```vim
mA        " 设置全局标记 A（大写字母是全局标记）
'A        " 跳转到标记 A（会自动切换 Buffer）
```

### 使用 args 管理文件集合

```vim
:args *.go            " 将所有 .go 文件加入参数列表
:argdo %s/foo/bar/g   " 在参数列表的所有文件中替换
:argdo w              " 保存参数列表中的所有文件
```

### 自动保存 Buffer

LazyVim 默认会在离开 Buffer 时自动保存（如果有修改）。

如果想禁用：
```lua
-- ~/.config/nvim/lua/config/options.lua
vim.opt.autowriteall = false
```

### Buffer 本地设置

```vim
:setlocal tabstop=4   " 只对当前 Buffer 生效
```

## 12. 常见问题

### Q: Buffer 太多了怎么办？

**方法1**：关闭其他
```
<Space>bo    只保留当前 Buffer
```

**方法2**：使用 Telescope 预览后再决定保留哪些
```
<Space>bb    查看所有 Buffer，Ctrl+d 删除不需要的
```

### Q: 怎么知道哪些 Buffer 没保存？

```vim
:ls         " 带 + 标记的是未保存的
```

或者看 bufferline，未保存的会有特殊标记（通常是圆点）。

### Q: 关闭 Buffer 后窗口也关了？

这是因为窗口没有其他 Buffer 可显示了。如果想保持窗口：

1. 先切换到其他 Buffer
2. 再关闭不需要的 Buffer

或者用 `<Space>bd`，LazyVim 会智能处理，尽量保持窗口。

### Q: 怎么恢复关闭的 Buffer？

```
<Space>fr    最近文件列表
```

### Q: Buffer 编号不连续怎么办？

这是正常的。Buffer 关闭后编号不会重新分配。如果想重新编号：

```vim
:bfirst     跳到第一个 Buffer
```

不过实际使用中，用名称切换（`:b name`）或 Telescope 更方便，不需要记编号。

---

## 总结

**日常最常用的 Buffer 操作：**

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 切换 Buffer | `<Space>bb` | Telescope 选择 |
| 快速切换 | `<Space>`` ` | 两个文件间来回 |
| 上/下一个 | `[b` / `]b` | 顺序切换 |
| 关闭 Buffer | `<Space>bd` | 删除当前 |
| 跳转历史 | `Ctrl+o` | 返回上一位置 |

**记住这 5 个快捷键，就能高效管理 Buffer！**
