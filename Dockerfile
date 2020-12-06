FROM ruby:2.6.6-alpine3.12

RUN apk update
RUN apk upgrade

RUN apk add --no-cache \
    bash git vim openssh openssl yarn sudo su-exec shadow tzdata \
    postgresql-client postgresql-dev \
    build-base libxml2-dev libxslt-dev

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID devel
RUN useradd -u $UID -g devel -m devel
RUN echo "devel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /tmp
COPY init/Gemfile /tmp/Gemfile
COPY init/Gemfile.lock /tmp/Gemfile.lock
RUN bundle install

COPY ./apps /apps

RUN apk add --no-cache openssl

USER devel

RUN openssl rand -hex 64 > /home/devel/.secret_key_base
RUN echo $'export SECRET_KEY_BASE=$(cat /home/devel/.secret_key_base)' \
  >> /home/devel/.bashrc

WORKDIR /apps
