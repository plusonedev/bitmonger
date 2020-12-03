FROM ruby:2.7.2-alpine AS builder

# Nokogiri's build dependencies
RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  bash \
  gcc \
  musl-dev \
  postgresql-dev \
  postgresql-libs \
  npm \
  yarn

COPY Gemfile Gemfile.lock ./

RUN bundle install

#FROM ruby:2.7.2-alpine

#RUN apk add --update bash

#COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

RUN adduser -D bitmonger
RUN chown -R bitmonger /usr/local/bundle
USER bitmonger

WORKDIR /home/bitmonger

# The files will be owned by my-sinatra-user
#COPY --chown=bitmonger Gemfile Gemfile.lock ./

RUN bundle install

