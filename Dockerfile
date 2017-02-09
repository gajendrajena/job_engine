FROM ubuntu:16.04

RUN echo 'apt-get update && apt-get install --no-install-recommends -y $*' > /usr/local/bin/pkg-deb
RUN chmod +x /usr/local/bin/pkg-*

RUN pkg-deb \
  build-essential=12.1ubuntu2 \
  ruby2.3 \
  ruby2.3-dev

RUN useradd --create-home --shell /bin/bash jobengine
RUN mkdir -p /src
RUN chown jobengine:jobengine /src
USER jobengine

WORKDIR /src
# Force choosing a command in docker-compose.yml or CLI
CMD false
