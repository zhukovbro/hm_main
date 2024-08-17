dev:
	docker-compose -f docker-compose.yml up -d

SSH_STRING:=root@94.198.216.72

ssh:
	ssh $(SSH_STRING)

rsync-back:
	ssh $(SSH_STRING) "mkdir -p /root/app/website" && \
	rsync -av \
      --exclude 'node_modules' \
      --exclude 'npm-debug.log' \
      --exclude 'Dockerfile' \
      --exclude '.git' \
      --exclude '.dockerignore' \
      --exclude '.strapi' \
      --exclude '.build' \
      --exclude '.env' \
      --exclude '.env.example' \
      --exclude '.eslintrc' \
      --exclude '.eslinignore' \
      --exclude '.gitignore' \
      --exclude 'Readme.md' \
      --exclude 'dist' \
      --exclude 'public' \
      ./website/ $(SSH_STRING):/root/app/website

rsync-front:
	ssh $(SSH_STRING) "mkdir -p /root/app/next2" && \
	rsync -av \
      --exclude 'node_modules' \
      --exclude 'npm-debug.log' \
      --exclude 'Dockerfile' \
      --exclude '.git' \
      --exclude '.dockerignore' \
      --exclude '.next' \
      --exclude '.gitignore' \
      --exclude '.eslintrc.json' \
      --exclude '.idea' \
      --exclude '.env' \
      --exclude '.github' \
      ./next2/ $(SSH_STRING):/root/app/next2

rsync-config:
	ssh $(SSH_STRING) "mkdir -p /root/app/config" && \
	rsync -av \
      --exclude '999website' \
      --exclude 'next' \
      --exclude 'next2' \
      --exclude 'website' \
      --exclude 'Makefile' \
      --exclude '.idea' \
      ./ $(SSH_STRING):/root/app/ && \
    ssh $(SSH_STRING) "mv /root/app/makefile_vps /root/app/Makefile"

rsync-all: rsync-back rsync-front rsync-config