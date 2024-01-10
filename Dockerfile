FROM alpine:latest
RUN apk --no-cache add \
    git \
    curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
WORKDIR /app
CMD ["/bin/sh"]
    
