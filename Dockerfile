FROM nginx:alpine

# 复制构建阶段的文件到 Nginx 服务目录
COPY . /usr/share/nginx/html

# 删除不需要的文件
RUN rm -rf /usr/share/nginx/html/.gitignore \
           /usr/share/nginx/html/LICENSE \
           /usr/share/nginx/html/README.md \
           /usr/share/nginx/html/TODO.md \
           /usr/share/nginx/html/Dockerfile

# 配置 Nginx（如果需要自定义配置）
# COPY nginx.conf /etc/nginx/nginx.conf

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]