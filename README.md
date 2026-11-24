To install dependencies:
```sh
bun install
```

To run:
```sh
bun run dev
```

open http://localhost:3000

## Docker

The image runs on the shell-less [chiseled-runtimes](https://github.com/agungdh/chiseled-runtimes)
Bun 1 runtime, with dependencies installed in a builder stage. Bun runs the
TypeScript source directly, so there is no build step.

```
docker build -t hono-bun-test .
docker run --rm -p 3000:3000 hono-bun-test
```

Prebuilt multi-arch images (`linux/amd64`, `linux/arm64`) are published to GHCR
on every push to `main`, on `v*` tags, and manually via `workflow_dispatch`:

```
docker run --rm -p 3000:3000 ghcr.io/agungdh/hono-bun-test:latest
```
