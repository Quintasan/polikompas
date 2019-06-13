FROM ruby:2.6.3-alpine

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
      postgresql-client
RUN bundle config build.nokogiri --use-system-libraries

RUN adduser -D app
USER app
RUN mkdir /home/app/src
WORKDIR /home/app/src
COPY --chown=app:app Gemfile* package.json yarn.lock /home/app/src/

RUN bundle install --jobs=$(nproc) --without=development test
RUN yarn install
COPY --chown=app:app . /home/app/src
RUN RAILS_ENV=production bin/rails webpacker:compile
CMD rm -f tmp/pids/server.pid && bin/rails -b 0.0.0.0 -p $PORT
