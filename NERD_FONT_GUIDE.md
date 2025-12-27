# Nerd Font 字体安装和配置指南

LazyVim 使用了大量的图标来美化界面，这些图标需要 Nerd Font 字体的支持。如果没有安装 Nerd Font，图标会显示为问号（?）。

## 问题现象

如果你看到以下情况，说明需要安装 Nerd Font：
- 文件树中的图标显示为 `?`
- 状态栏中的图标显示异常
- Git 标记显示为问号
- LSP 诊断图标显示异常

## 安装字体

### 方法1：使用安装脚本（推荐）

```bash
# 运行安装脚本
bash install-nerd-font.sh
```

这个脚本会：
1. 下载 JetBrainsMono Nerd Font
2. 安装到 `~/.local/share/fonts/` 目录
3. 刷新字体缓存

### 方法2：手动安装

1. 访问 [Nerd Fonts 官网](https://www.nerdfonts.com/font-downloads)
2. 下载推荐的字体之一：
   - JetBrainsMono Nerd Font（推荐）
   - FiraCode Nerd Font
   - Hack Nerd Font
   - Meslo Nerd Font
3. 解压下载的字体文件
4. 安装字体：
   ```bash
   mkdir -p ~/.local/share/fonts
   cp *.ttf ~/.local/share/fonts/
   fc-cache -fv
   ```

## 配置终端使用 Nerd Font

安装字体后，需要配置你的终端模拟器使用 Nerd Font。

### GNOME Terminal

1. 打开 GNOME Terminal
2. 右键点击窗口 → 首选项（Preferences）
3. 选择你的配置文件
4. 取消勾选 "使用系统固定宽度字体"
5. 点击字体选择器
6. 搜索并选择 `JetBrainsMono Nerd Font` 或 `JetBrainsMono NF`
7. 推荐字体大小：12 或 13

### Terminator

编辑配置文件 `~/.config/terminator/config`：

```ini
[profiles]
  [[default]]
    font = JetBrainsMono Nerd Font 12
    use_system_font = False
```

### Kitty

编辑 `~/.config/kitty/kitty.conf`：

```conf
font_family      JetBrainsMono Nerd Font
bold_font        JetBrainsMono Nerd Font Bold
italic_font      JetBrainsMono Nerd Font Italic
bold_italic_font JetBrainsMono Nerd Font Bold Italic

font_size 12.0
```

### Alacritty

编辑 `~/.config/alacritty/alacritty.yml`：

```yaml
font:
  normal:
    family: "JetBrainsMono Nerd Font"
    style: Regular
  bold:
    family: "JetBrainsMono Nerd Font"
    style: Bold
  italic:
    family: "JetBrainsMono Nerd Font"
    style: Italic
  size: 12.0
```

### WezTerm

编辑 `~/.config/wezterm/wezterm.lua`：

```lua
local wezterm = require 'wezterm'

return {
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 12.0,
}
```

### Konsole (KDE)

1. 打开 Konsole
2. 设置（Settings） → 编辑当前配置（Edit Current Profile）
3. 外观（Appearance） → 选择字体（Select Font）
4. 搜索并选择 `JetBrainsMono Nerd Font`
5. 设置大小为 12

### Tilix

1. 打开 Tilix
2. 首选项（Preferences） → 配置文件（Profiles）
3. 选择你的配置文件
4. 取消勾选 "使用系统字体"
5. 选择 `JetBrainsMono Nerd Font`

### tmux

如果你在 tmux 中使用 Neovim，确保：
1. 你的底层终端（如 GNOME Terminal）已配置 Nerd Font
2. tmux 会继承终端的字体设置

### Windows Terminal

编辑 `settings.json`：

```json
{
  "profiles": {
    "defaults": {
      "font": {
        "face": "JetBrainsMono NF",
        "size": 12
      }
    }
  }
}
```

### VS Code 集成终端

编辑 VS Code 设置（`settings.json`）：

```json
{
  "terminal.integrated.fontFamily": "JetBrainsMono Nerd Font",
  "terminal.integrated.fontSize": 12
}
```

## 验证安装

### 1. 验证字体已安装

```bash
fc-list | grep -i "JetBrains"
```

应该能看到多个 JetBrainsMono Nerd Font 的字体文件。

### 2. 在终端中测试图标

```bash
# 输出一些 Nerd Font 图标
echo -e "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
```

如果你能看到图标而不是方块或问号，说明配置成功！

### 3. 在 Neovim 中验证

打开 LazyVim：
```bash
nvim
```

检查以下位置是否正常显示图标：
- 文件树（按 `<Space>e`）
- 状态栏底部
- 标签页图标
- LSP 诊断图标

## 常见问题

### Q: 配置后图标还是显示问号？

A: 尝试以下步骤：
1. **完全关闭并重启终端**（不是新建标签页）
2. 确认终端字体设置生效：
   ```bash
   fc-match "JetBrainsMono Nerd Font"
   ```
3. 在终端中测试图标显示
4. 清除 Neovim 缓存并重启：
   ```bash
   rm -rf ~/.local/state/nvim
   nvim
   ```

### Q: 字体安装后找不到？

A: 刷新字体缓存：
```bash
fc-cache -fv ~/.local/share/fonts
```

### Q: 我想使用其他 Nerd Font？

A: 可以从 [nerdfonts.com](https://www.nerdfonts.com/) 下载任何你喜欢的字体，安装步骤相同。推荐的字体：
- **JetBrainsMono Nerd Font** - 适合编程，清晰易读
- **FiraCode Nerd Font** - 支持连字，优雅美观
- **Hack Nerd Font** - 简洁清晰
- **Meslo Nerd Font** - 经典等宽字体

### Q: 字体太大或太小？

A: 在终端设置中调整字体大小，推荐：
- **笔记本屏幕**：11-12
- **桌面显示器**：12-13
- **4K 显示器**：14-16

### Q: 某些图标还是显示异常？

A: 确保：
1. 使用的是完整的 Nerd Font（带 "Nerd Font" 标记）
2. 没有使用 "Mono" 版本（使用 Regular 版本）
3. 终端支持真彩色（truecolor）：
   ```bash
   echo $COLORTERM
   # 应该输出: truecolor 或 24bit
   ```

## 其他优秀的 Nerd Font 字体

| 字体名称 | 特点 | 适合场景 |
|---------|------|---------|
| JetBrainsMono | 优秀的等宽字体，清晰易读 | 长时间编程 |
| FiraCode | 支持连字，美观 | 喜欢连字特性 |
| Hack | 简洁清晰，字符区分度高 | 代码阅读 |
| Meslo | 经典等宽字体 | 通用场景 |
| CaskaydiaCove | 基于 Cascadia Code | Windows 用户 |
| Iosevka | 窄字体，信息密度高 | 小屏幕 |

## 推荐终端配置

### 最佳实践

```bash
# 字体设置
字体: JetBrainsMono Nerd Font
大小: 12-13
行距: 1.2

# 主题
推荐使用与 LazyVim 主题一致的终端主题
LazyVim 默认: tokyonight
```

## 字体文件位置

- **用户级别**：`~/.local/share/fonts/`（推荐）
- **系统级别**：`/usr/share/fonts/`（需要 sudo）

## 相关链接

- [Nerd Fonts 官网](https://www.nerdfonts.com/)
- [Nerd Fonts GitHub](https://github.com/ryanoasis/nerd-fonts)
- [字体下载页面](https://www.nerdfonts.com/font-downloads)
- [LazyVim 文档](https://www.lazyvim.org/)

---

**配置完成后，记得完全重启终端，然后重新打开 LazyVim 享受美观的图标！** ✨
