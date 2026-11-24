# syntax=docker/dockerfile:1

ARG BUN_IMAGE=oven/bun:1
ARG RUNTIME_IMAGE=ghcr.io/agungdh/chiseled-runtimes/bun:1-ubuntu26.04

FROM ${BUN_IMAGE} AS deps
WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

FROM ${RUNTIME_IMAGE}

ENV NODE_ENV=production

COPY --from=deps --chown=10001:10001 /app/node_modules ./node_modules
COPY --chown=10001:10001 package.json ./package.json
COPY --chown=10001:10001 src ./src

EXPOSE 3000

CMD ["bun", "src/index.ts"]
