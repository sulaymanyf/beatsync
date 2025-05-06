# 使用 bun 官方镜像来构建和启动项目
FROM oven/bun:1.0 AS builder

WORKDIR /app

# 拷贝所有项目文件
COPY . .

# 安装所有依赖
RUN bun install

# 生产环境：单独运行客户端和后端
FROM oven/bun:1.0

WORKDIR /app

# 拷贝构建后的文件
COPY --from=builder /app/apps/client /app/apps/client
COPY --from=builder /app/apps/server /app/apps/server
COPY --from=builder /app/node_modules /app/node_modules

# 暴露端口（前端和后端）
EXPOSE 3000
EXPOSE 8080

# 启动前后端服务
CMD ["bun", "start"]
