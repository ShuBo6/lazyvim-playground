#!/bin/bash
# Install Nerd Fonts for LazyVim icons

set -e

echo "🎨 Installing Nerd Fonts for LazyVim..."
echo ""

# 创建字体目录
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# 下载 JetBrainsMono Nerd Font（推荐）
FONT_NAME="JetBrainsMono"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
TEMP_DIR=$(mktemp -d)

echo "📦 Downloading $FONT_NAME Nerd Font..."
cd "$TEMP_DIR"
curl -fLo "${FONT_NAME}.zip" "$FONT_URL"

echo "📂 Extracting fonts..."
unzip -q "${FONT_NAME}.zip" -d "$FONT_DIR/$FONT_NAME"

# 清理临时文件
cd -
rm -rf "$TEMP_DIR"

# 刷新字体缓存
echo "🔄 Refreshing font cache..."
fc-cache -fv "$FONT_DIR" >/dev/null 2>&1

echo ""
echo "✅ Nerd Font installed successfully!"
echo ""
echo "📝 下一步："
echo "1. 配置你的终端使用 'JetBrainsMono Nerd Font' 字体"
echo "2. 重启终端"
echo "3. 重新打开 nvim，图标应该可以正常显示了"
echo ""
echo "🎯 推荐字体设置："
echo "  字体名称: JetBrainsMono Nerd Font"
echo "  字体大小: 12 或 13"
echo ""
