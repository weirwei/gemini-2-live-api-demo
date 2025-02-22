FROM nginx:alpine

# 复制证书和私钥到 Nginx 目录
COPY fullchain.cer /etc/nginx/ssl/certificate.crt
COPY fehead.weirwei.cn.key /etc/nginx/ssl/private.key

# 复制构建阶段的文件到 Nginx 服务目录
COPY . /usr/share/nginx/html

# 删除不需要的文件
RUN rm -rf /usr/share/nginx/html/.gitignore \
           /usr/share/nginx/html/LICENSE \
           /usr/share/nginx/html/README.md \
           /usr/share/nginx/html/TODO.md \
           /usr/share/nginx/html/Dockerfile

# 配置 Nginx（如果需要自定义配置）
COPY nginx.conf /etc/nginx/nginx.conf

# 暴露 80 和 443 端口
EXPOSE 80 443

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]