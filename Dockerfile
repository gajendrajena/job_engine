FROM ubuntu:16.04

RUN echo 'apt-get update && apt-get install --no-install-recommends -y $*' > /usr/local/bin/pkg-deb
RUN echo 'gem install --no-ri --no-rdoc $*' > /usr/local/bin/pkg-gem
RUN chmod +x /usr/local/bin/pkg-*

RUN pkg-deb \
  build-essential=12.1ubuntu2 \
  ruby2.3 \
  ruby2.3-dev

RUN pkg-gem bundler:1.14.3
RUN bundle config --global silence_root_warning 1

# Used for `middleman init`
RUN pkg-deb git=1:2.7.4-0ubuntu1

# These are the slowest installs of all the gem dependencies, so split them out to make rebuilds faster
RUN pkg-gem fast_blank:1.0.0
RUN pkg-gem ffi:1.9.17
RUN pkg-gem mini_racer:0.1.8 # execjs runtime
RUN pkg-gem eventmachine:1.2.2

RUN pkg-gem middleman:4.2.1

RUN useradd --create-home --shell /bin/bash jobengine
RUN mkdir -p /src
RUN chown jobengine:jobengine /src
USER jobengine

WORKDIR /src
# Force choosing a command in docker-compose.yml or CLI
CMD false
