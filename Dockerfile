# Dockerfile
FROM debian:bullseye

RUN apt-get update && \
  apt-get install -y wget && \
  mkdir -p /opt/downloads

ARG PACKAGE_URL
RUN wget -O /opt/downloads/package.tar.gz "$PACKAGE_URL"

CMD ["ls", "-lh", "/opt/downloads"]
