# 使用 bun 官方镜像来构建和启动项目
FROM oven/bun:latest AS builder 

WORKDIR /app
ENV NODE_ENV=production

# 拷贝所有项目文件
COPY . .

# 拷贝 env 文件（开发环境）
COPY apps/client/env.example apps/client/.env

# 安装所有依赖
RUN bun install --frozen-lockfile



WORKDIR /app

# 暴露端口（前端和后端）
EXPOSE 3008
EXPOSE 8089

# 启动前后端服务
CMD ["bun", "run", "start"]
