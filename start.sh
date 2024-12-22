#!/bin/bash

# 读取项目到本地
git clone https://github.com/sitegroupcom/docs.git

# 安装 gitingest
pip install gitingest

# 设置base目录
gitingest ./docs

# 检查 docs.txt 文件是否存在
if [[ ! -f docs.txt ]]; then
  echo "docs.txt 文件未找到!"
  exit 1
fi

# 读取 docs.txt 中的每个 URL 并执行 gitingest
while IFS= read -r url; do
  if [[ -n "$url" ]]; then
    echo "正在处理 URL: $url"
    gitingest "$url"
  fi
done < docs.txt

ls -ls ./docs
