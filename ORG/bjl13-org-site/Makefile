build:
	docker build -t bjl13-hugo-caddy .

run:
	docker run -d --name bes-web \
	  -p 80:80 -p 443:443 \
	  --restart unless-stopped \
	  bjl13-hugo-caddy

stop:
	docker stop bes-web || true
	docker rm bes-web || true

rebuild: stop build run

compose-up:
	docker compose up -d

compose-down:
	docker compose down