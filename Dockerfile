FROM ubuntu:16.04

RUN echo 'apt-get update && apt-get install --no-install-recommends -y $*' > /usr/local/bin/pkg-deb
RUN chmod +x /usr/local/bin/pkg-*

RUN pkg-deb \
  build-essential=12.1ubuntu2 \
  ruby2.3 \
  ruby2.3-dev

USER jobengine

# Force choosing a command in docker-compose.yml or CLI
CMD false
