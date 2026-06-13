#!/bin/bash

# Pixiv-WallPaper 自动安装脚本
# 此脚本将自动克隆项目、设置权限并完成初始配置

set -e  # 任何错误都会退出脚本

echo "================================"
echo "Pixiv-WallPaper 安装脚本"
echo "================================"
echo ""

# 检查是否已安装 git
if ! command -v git &> /dev/null; then
    echo "❌ 错误：未检测到 git，请先安装 git"
    exit 1
fi

echo "📦 第一步：克隆项目..."
if [ -d "Pixiv-WallPaper" ]; then
    echo "⚠️  项目目录已存在，跳过克隆"
else
    git clone git@github.com:LeoJhonSong/Pixiv-WallPaper.git
    echo "✅ 项目克隆成功"
fi

echo ""
echo "🔧 第二步：设置执行权限..."
cd Pixiv-WallPaper

# 给脚本添加执行权限
if [ -f "Pixiv-Wallpaper.py" ]; then
    chmod a+x Pixiv-Wallpaper.py
    echo "✅ Pixiv-Wallpaper.py 权限设置成功"
else
    echo "⚠️  警告：未找到 Pixiv-Wallpaper.py"
fi

if [ -f "Startup.sh" ]; then
    chmod a+x Startup.sh
    echo "✅ Startup.sh 权限设置成功"
else
    echo "⚠️  警告：未找到 Startup.sh"
fi

echo ""
echo "================================"
echo "✨ 安装完成！"
echo "================================"
echo ""
echo "📝 后续步骤："
echo "1. 进入项目目录: cd Pixiv-WallPaper"
echo "2. 查看 README 了解配置: cat README.md"
echo "3. 运行启动脚本: ./Startup.sh"
echo ""
