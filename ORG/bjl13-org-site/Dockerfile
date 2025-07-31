<<<<<<< HEAD
# 🧱 Stage 1: Build with Hugo
=======
# ---- Stage 1: Build with Hugo ----
>>>>>>> ca161633cecb2b3607c0926987b7df67d5809ee7
FROM klakegg/hugo:ext-alpine AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

<<<<<<< HEAD
# 🌐 Stage 2: Serve with Caddy
FROM caddy:2-alpine
WORKDIR /org
COPY --from=builder /src/public ./public
COPY Caddyfile /etc/caddy/Caddyfile

RUN find ./public -type d -exec chmod 755 {} \; \
 && find ./public -type f -exec chmod 644 {} \;

EXPOSE 80 443
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddy"]
=======
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
>>>>>>> ca161633cecb2b3607c0926987b7df67d5809ee7
