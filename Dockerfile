FROM debian:11.6-slim

RUN apt update && apt -y upgrade && apt-get install -y curl ca-certificates gettext-base
RUN curl -Lo doctl.tar.gz https://github.com/digitalocean/doctl/releases/download/v1.93.1/doctl-1.93.1-linux-amd64.tar.gz && tar xf doctl.tar.gz
RUN chmod u+x doctl
RUN mv doctl /usr/local/bin/doctl
RUN curl -LO "https://dl.k8s.io/release/v1.26.2/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/v1.26.2/bin/linux/amd64/kubectl.sha256"
RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
RUN chmod +x kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
