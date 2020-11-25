FROM ruby:2.6.6-alpine

ARG CREDENTIALS_KEY=changeme
ENV RAILS_MASTER_KEY=$CREDENTIALS_KEY

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV PORT 3000

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      yarn \
      git \
      postgresql-client \
      bash
RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir -p /var/src/app
WORKDIR /var/src/app
COPY Gemfile* package.json yarn.lock /var/src/app/

RUN bundle install --jobs=$(nproc) --without=development test
RUN yarn install
COPY . /var/src/app
CMD docker/start
