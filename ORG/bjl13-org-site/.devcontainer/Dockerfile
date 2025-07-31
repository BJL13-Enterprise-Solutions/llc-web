# Hugo + Docker + CLI utils
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install Hugo + Docker CLI tools + rsync + watchexec
RUN apt-get update && \
    apt-get install -y hugo rsync openssh-client curl git \
    docker.io docker-compose \
    unzip zip jq build-essential && \
    curl -sSL https://github.com/watchexec/watchexec/releases/latest/download/watchexec-x86_64-unknown-linux-gnu.tar.xz \
      | tar -xJf - -C /usr/local/bin --strip-components=1 watchexec*/watchexec

# Set user to non-root devcontainer user
USER vscode

# Create working directory
WORKDIR /workspace
