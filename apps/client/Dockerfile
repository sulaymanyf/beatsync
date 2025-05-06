# Stage 1: Install deps & build Next.js app
FROM node:20 AS builder

WORKDIR /app

COPY . .

# 安装依赖（包括 Turborepo 依赖）
RUN corepack enable && \
    corepack prepare pnpm@latest --activate && \
    pnpm install && \
    pnpm build --filter client...

# Stage 2: Run production
FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app/apps/client/.next .next
COPY --from=builder /app/apps/client/public ./public
COPY --from=builder /app/apps/client/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules

ENV NODE_ENV=production
EXPOSE 3000

CMD ["node_modules/.bin/next", "start"]