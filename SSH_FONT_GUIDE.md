# SSH 场景下的 Nerd Font 配置指南

## 重要概念

当通过 SSH 使用 LazyVim 时：
- **字体安装在 SSH 客户端（你的本地电脑）**
- **不需要在服务器端安装字体**

### 为什么？

```
工作原理：
┌─────────────────┐         ┌──────────────────┐
│  本地电脑        │  SSH    │   远程服务器      │
│  (客户端)        │ ←────→  │   (服务器)        │
├─────────────────┤         ├──────────────────┤
│ 终端模拟器       │         │ Neovim运行       │
│ ├─ 字体渲染     │ ←文字─  │ ├─ 发送字符编码  │
│ └─ 显示图标     │         │ └─ (如 \ue0b0)  │
└─────────────────┘         └──────────────────┘
```

## 按操作系统安装 Nerd Font

### Windows 用户

#### 方法1：手动安装（推荐）

1. 下载字体：
   - 访问 https://www.nerdfonts.com/font-downloads
   - 下载 `JetBrainsMono.zip`

2. 安装字体：
   - 解压 zip 文件
   - 选择所有 `.ttf` 文件
   - 右键 → **为所有用户安装**

3. 配置终端：

**Windows Terminal（推荐）**
```json
// 打开设置 (Ctrl+,) → 打开 JSON 文件
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

**PowerShell**
- 打开 PowerShell
- 右键标题栏 → 属性 → 字体
- 选择 `JetBrainsMono NF`

**PuTTY**
```
Window → Appearance → Font settings
选择: JetBrainsMono NF
大小: 12
```

**MobaXterm**
```
Settings → Configuration → Terminal
Font: JetBrainsMono NF
Size: 12
```

#### 方法2：使用 Scoop

```powershell
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF
```

#### 方法3：使用 Chocolatey

```powershell
choco install jetbrainsmono-nf
```

### macOS 用户

#### 方法1：使用 Homebrew（推荐）

```bash
# 安装字体
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
```

#### 方法2：手动安装

1. 下载字体：https://www.nerdfonts.com/font-downloads
2. 解压并双击 `.ttf` 文件
3. 点击 "安装字体"

#### 配置终端

**iTerm2（推荐）**
```
Preferences → Profiles → Text
Font: JetBrainsMono Nerd Font
Size: 13
```

**Terminal.app**
```
Preferences → Profiles → Font
点击 "Change..." → 选择 JetBrainsMono Nerd Font
```

**Warp**
```
Settings → Appearance → Text
Font: JetBrainsMono Nerd Font
```

### Linux 桌面用户

#### 安装字体

```bash
# 创建字体目录
mkdir -p ~/.local/share/fonts

# 下载并安装
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
rm JetBrainsMono.zip

# 刷新字体缓存
fc-cache -fv ~/.local/share/fonts
```

#### 配置终端

**GNOME Terminal**
```
右键 → 首选项 → 配置文件
取消 "使用系统固定宽度字体"
自定义字体: JetBrainsMono Nerd Font 12
```

**Konsole (KDE)**
```
Settings → Edit Current Profile
Appearance → Select Font
选择: JetBrainsMono Nerd Font
```

**Terminator**
编辑 `~/.config/terminator/config`:
```ini
[profiles]
  [[default]]
    font = JetBrainsMono Nerd Font 12
    use_system_font = False
```

**Tilix**
```
Preferences → Profiles → 你的配置
取消 "Use system font"
Custom font: JetBrainsMono Nerd Font 12
```

## 验证安装

### 1. 在本地终端测试（关键步骤！）

**不要 SSH，直接在本地终端运行：**

```bash
# 测试图标显示
echo -e "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
```

**期望结果**：
- ✅ 看到各种图标（箭头、加减号、闪电等）
- ❌ 如果看到方块或问号，说明字体未正确配置

### 2. 测试 SSH + LazyVim

如果本地测试通过：

```bash
# SSH 连接到服务器
ssh user@your-server

# 打开 nvim
nvim
```

按 `<Space>e` 打开文件树，检查图标是否正常显示。

## 常见问题排查

### Q: 本地测试通过，但 SSH 后 nvim 图标还是问号？

**检查列表：**

1. **终端是否支持 UTF-8？**
   ```bash
   # 在服务器端检查
   echo $LANG
   # 应该包含 UTF-8，如: en_US.UTF-8

   # 如果不是，设置：
   export LANG=en_US.UTF-8
   export LC_ALL=en_US.UTF-8
   ```

2. **SSH 是否正确传输 UTF-8？**

   在本地 `~/.ssh/config` 添加：
   ```
   Host *
     SendEnv LANG LC_*
   ```

3. **$TERM 变量正确吗？**
   ```bash
   echo $TERM
   # 推荐: xterm-256color

   # 如果不对，在 ~/.bashrc 或 ~/.zshrc 添加：
   export TERM=xterm-256color
   ```

### Q: 字体安装后找不到？

**Windows:**
```powershell
# 重启终端，或注销/重新登录
```

**macOS:**
```bash
# 验证字体安装
fc-list | grep -i "JetBrains"
# 或打开 Font Book 应用检查
```

**Linux:**
```bash
# 刷新字体缓存
fc-cache -fv

# 验证
fc-list | grep -i "JetBrains"
```

### Q: 某些图标正常，某些异常？

**确保使用的是完整版本：**
- ✅ `JetBrainsMono Nerd Font`
- ✅ `JetBrainsMono NF`
- ❌ 不要用 `JetBrainsMono Nerd Font Mono`
- ❌ 不要用普通的 `JetBrainsMono`（不带 Nerd Font）

### Q: 我用的是 VS Code 的远程 SSH？

**配置 VS Code：**

1. 打开设置 (Ctrl+,)
2. 搜索 `terminal.integrated.fontFamily`
3. 设置为：`'JetBrainsMono Nerd Font'`
4. 重启 VS Code

### Q: PuTTY 中文显示乱码？

```
Window → Translation
Remote character set: UTF-8
```

## 推荐配置

### 完整的 SSH 配置示例

**本地 `~/.ssh/config`：**
```
Host myserver
    HostName 192.168.1.100
    User yourname
    SendEnv LANG LC_*

# 对所有主机生效
Host *
    SendEnv LANG LC_*
```

**服务器端 `~/.bashrc` 或 `~/.zshrc`：**
```bash
# 设置 locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 设置终端类型
export TERM=xterm-256color

# 如果使用 tmux
export TERM=screen-256color  # 在 tmux 内部
```

## 测试清单

完成配置后，按顺序测试：

- [ ] **步骤1**：在本地终端运行 `echo -e "\ue0b0"` 能看到图标
- [ ] **步骤2**：SSH 到服务器，`echo $LANG` 显示 UTF-8
- [ ] **步骤3**：在服务器上 `echo -e "\ue0b0"` 能看到图标
- [ ] **步骤4**：打开 nvim，按 `<Space>e`，文件树图标正常
- [ ] **步骤5**：状态栏、标签页图标都正常

## 推荐的终端 + 字体组合

| 操作系统 | 推荐终端 | 字体 |
|---------|---------|------|
| Windows | Windows Terminal | JetBrainsMono NF |
| macOS | iTerm2 | JetBrainsMono Nerd Font |
| Linux | Terminator / Alacritty | JetBrainsMono Nerd Font |

## 其他优秀的 Nerd Font

如果不喜欢 JetBrainsMono，可以尝试：

| 字体名称 | 特点 | 下载命令 |
|---------|------|---------|
| FiraCode | 支持连字 | `brew install font-fira-code-nerd-font` |
| Hack | 清晰简洁 | `brew install font-hack-nerd-font` |
| Meslo | 经典等宽 | `brew install font-meslo-lg-nerd-font` |
| CascadiaCode | 微软开发 | `brew install font-caskaydia-cove-nerd-font` |

## 相关链接

- [Nerd Fonts 官网](https://www.nerdfonts.com/)
- [Nerd Fonts GitHub](https://github.com/ryanoasis/nerd-fonts)
- [Windows Terminal 文档](https://docs.microsoft.com/en-us/windows/terminal/)
- [iTerm2 官网](https://iterm2.com/)

---

**记住：SSH 场景下，字体装在客户端（你的电脑），不是服务器！** 🎯
