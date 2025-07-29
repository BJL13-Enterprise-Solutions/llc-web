# ---- Stage 1: Build with Hugo ----
FROM klakegg/hugo:0.126.1-ext-alpine AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# ---- Stage 2: Static server with Caddy ----
FROM caddy:2-alpine
WORKDIR /org
COPY --from=builder /src/public ./public
COPY Caddyfile /etc/caddy/Caddyfile

RUN find ./public -type d -exec chmod 755 {} \; \
 && find ./public -type f -exec chmod 644 {} \;

EXPOSE 80 443
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
# ---- Stage 1: Build with Hugo ----
FROM klakegg/hugo:0.126.1-ext-alpine AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# ---- Stage 2: Serve with Caddy ----
FROM caddy:2-alpine

# Set working directory to match site root
WORKDIR /org

# Copy the built static site from builder stage
COPY --from=builder /src/public ./public

# Copy Caddy config (ensure Caddyfile is in repo root)
COPY Caddyfile /etc/caddy/Caddyfile

# Set permissions: 755 for dirs, 644 for files (best practice)
RUN find ./public -type d -exec chmod 755 {} \; \
 && find ./public -type f -exec chmod 644 {} \;

# Expose HTTP/HTTPS
EXPOSE 80 443

# Optional: set a non-root user (for extra hardening)
# RUN adduser -D -u 10001 caddyuser
# USER caddyuser

# Caddy launch command
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
