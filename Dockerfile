# Stage 1: Downloader
FROM debian:bullseye AS downloader

ARG PACKAGE_URL
ARG PACKAGE_NAME=package.tar.gz

RUN apt-get update && \
  apt-get install -y wget && \
  mkdir -p /downloads && \
  wget -O /downloads/${PACKAGE_NAME} "$PACKAGE_URL"

# Stage 2: Final minimal image
FROM debian:bullseye AS final

COPY --from=downloader /downloads /opt/downloads

CMD ["ls", "-lh", "/opt/downloads"]
