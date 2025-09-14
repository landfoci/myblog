#!/bin/bash

# Dừng nếu có lỗi
set -e

# 1. Build site Hugo
echo "⚡ Đang build Hugo..."
hugo

# 2. Vào thư mục public
cd public

# 3. Khởi tạo git (nếu chưa có)
if [ ! -d .git ]; then
  git init
  git remote add origin git@github.com:landfoci/landfoci.github.io.git
fi

# 4. Commit và push
git add .
git commit -m "Cập nhật site $(date)"
git branch -M main
git push -u origin main --force

# 5. Quay lại thư mục gốc
cd ..

echo "✅ Deploy xong! Xem blog tại: https://landfoci.github.io"
