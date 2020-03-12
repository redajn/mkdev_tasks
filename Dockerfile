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

RUN gem install bundler
RUN bundle update --bundler
RUN bundle install -j $(nproc) && yarn install
