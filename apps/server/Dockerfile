# Bun 官方提供的镜像
FROM oven/bun:1.0

WORKDIR /app

COPY . .

RUN bun install

EXPOSE 8787
CMD ["bun", "apps/server/index.ts"]