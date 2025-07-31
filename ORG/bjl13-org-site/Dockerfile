# 🧱 Stage 1: Build with Hugo
FROM klakegg/hugo:ext-alpine AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# 🌐 Stage 2: Serve with Caddy
FROM caddy:2-alpine
WORKDIR /org
COPY --from=builder /src/public ./public
COPY Caddyfile /etc/caddy/Caddyfile

RUN find ./public -type d -exec chmod 755 {} \; \
 && find ./public -type f -exec chmod 644 {} \;

EXPOSE 80 443
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddy"]