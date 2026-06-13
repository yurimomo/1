#!/bin/bash

# Pixiv-WallPaper 完整安装脚本
# 此脚本将自动完成所有安装和配置步骤

set -e  # 任何错误都会退出脚本

echo "================================"
echo "Pixiv-WallPaper 完整安装脚本"
echo "================================"
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查 Python3
echo "📋 检查系统依赖..."
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ 错误：未检测到 Python3，请先安装 Python3${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Python3 已安装${NC}"

# 检查 git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ 错误：未检测到 git，请先安装 git${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Git 已安装${NC}"

echo ""
echo "📦 检查 Python 依赖..."
# 检查 requests 库
if python3 -c "import requests" 2>/dev/null; then
    echo -e "${GREEN}✅ requests 库已安装${NC}"
else
    echo -e "${YELLOW}⚠️  requests 库未安装，正在安装...${NC}"
    pip install requests
    echo -e "${GREEN}✅ requests 库安装成功${NC}"
fi

echo ""
echo "🔗 第一步：克隆项目..."
if [ -d "Pixiv-WallPaper" ]; then
    echo -e "${YELLOW}⚠️  项目目录已存在，跳过克隆${NC}"
else
    git clone git@github.com:LeoJhonSong/Pixiv-WallPaper.git
    echo -e "${GREEN}✅ 项目克隆成功${NC}"
fi

echo ""
echo "📁 进入项目目录..."
cd Pixiv-WallPaper

echo ""
echo "🔧 第二步：设置执行权限..."
# 给脚本添加执行权限
if [ -f "Pixiv-Wallpaper.py" ]; then
    chmod a+x Pixiv-Wallpaper.py
    echo -e "${GREEN}✅ Pixiv-Wallpaper.py 权限设置成功${NC}"
else
    echo -e "${YELLOW}⚠️  未找到 Pixiv-Wallpaper.py${NC}"
fi

if [ -f "Startup.sh" ]; then
    chmod a+x Startup.sh
    echo -e "${GREEN}✅ Startup.sh 权限设置成功${NC}"
else
    echo -e "${YELLOW}⚠️  未找到 Startup.sh${NC}"
fi

echo ""
echo "📁 第三步：创建缓存目录..."
CACHE_DIR="$HOME/Pictures/Pixiv-WallPaper-Cache"
if [ ! -d "$CACHE_DIR" ]; then
    mkdir -p "$CACHE_DIR"
    echo -e "${GREEN}✅ 缓存目录创建成功: $CACHE_DIR${NC}"
else
    echo -e "${YELLOW}⚠️  缓存目录已存在: $CACHE_DIR${NC}"
fi

echo ""
echo "================================"
echo -e "${GREEN}✨ 安装完成！${NC}"
echo "================================"
echo ""
echo "📝 后续步骤："
echo "1. 返回项目目录: cd Pixiv-WallPaper"
echo "2. 查看配置说明: cat README.md"
echo "3. 根据需要编辑配置: vi Pixiv-Wallpaper.py (修改 path 和 period 参数)"
echo "4. 运行启动脚本: ./Startup.sh"
echo ""
echo "💡 提示："
echo "   - 默认缓存位置: $CACHE_DIR"
echo "   - 默认更新间隔: 1 分钟"
echo "   - 可在 Pixiv-Wallpaper.py 中修改这些配置"
echo ""
