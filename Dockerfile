FROM ruby:2.6.4-alpine

RUN apk add --update --no-cache \
      build-base \
      git \
      postgresql-dev \
      yaml-dev \
      zlib-dev \
      nodejs \
      yarn

WORKDIR /app

COPY . .

RUN gem install bundler && bundle install -j $(nproc) \
      && bundle update --bundler && yarn install
