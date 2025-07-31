---

## title: BJL13.org Deployment Pipeline description: Local-first Hugo site deployment with remote Dockerized Caddy delivery.

# 🟣 BJL13.org – Hugo Site Deployment Pipeline

This repository contains the static site source and deployment pipeline for the **BJL13.org** website, maintained by BJL13 Enterprise Solutions LLC.

The site is built with **Hugo** and served using **Caddy** in a Docker container on a remote DigitalOcean droplet.

---

## 🛠 Deployment Overview

| Stage              | Performed on                              | Tool              |
| ------------------ | ----------------------------------------- | ----------------- |
| Write/edit content | 💻 Laptop                                 | Markdown + Hugo   |
| Build static site  | 💻 Laptop                                 | `hugo`            |
| Sync build output  | 💻 Laptop → 🌐 Droplet                    | `rsync` via SSH   |
| Restart web server | 🌐 Droplet                                | `docker-compose`  |
| Public access      | 🌐 [https://bjl13.org](https://bjl13.org) | HTTPS (via Caddy) |

---

## 🚀 How to Deploy

> One-liner: **Edit → Save → Live** — no server login required.

### 🔁 Automatic Deploy on File Save (recommended)

Install [`watchexec`](https://github.com/watchexec/watchexec) and run:

```bash
watchexec -w content -w layouts -w static -w config.toml -e md,toml,html,css,js -- ./deploy-on-save.sh
```

This will:

- Build the site with `hugo`
- Sync `./public/` to the droplet
- Trigger a remote rebuild of the Caddy container

---

### ⚙️ Manual Deploy (no automation)

1. **Build the site**:

   ```bash
   hugo --cleanDestinationDir --destination ./public
   ```

2. **Sync to droplet**:

   ```bash
   rsync -az --delete -e "ssh -i ~/.ssh/bjl13_rsa" ./public/ bjl@bjl13.com:/home/bjl/src/ORG/bjl13-org-site/public/
   ```

3. **SSH and rebuild**:

   ```bash
   ssh -i ~/.ssh/bjl13_rsa bjl@bjl13.com '~/src/ORG/bjl13-org-site/rebuild-container.sh'
   ```

---

## 🧹 Files and Structure

```
bjl13-org-site/
├── content/              # Hugo Markdown pages
├── layouts/              # Custom Hugo templates
├── static/               # CSS, JS, images, etc.
├── public/               # Hugo output (auto-generated)
├── Caddyfile             # Caddy config for live site
├── docker-compose.yml    # Runs Caddy container
├── deploy-on-save.sh     # Local deploy pipeline
├── rebuild-container.sh  # Remote Docker restart
├── README.md             # (this file)
```

---

## 🔒 SSH Key Assumptions

This repo assumes:

- SSH private key: `~/.ssh/bjl13_rsa`
- Remote user: `bjl`
- Host: `bjl13.com`

Change these inside `deploy-on-save.sh` if needed.

---

## 🧠 Tips

- Don't edit `public/` directly — it is overwritten on every `hugo` build
- All deployment is push-based: nothing runs *from* the server unless triggered
- Caddy will auto-renew HTTPS certs; no cron required

---

## 🚼 License

All content is copyright © 2025 BJL13 Enterprise Solutions LLC.

