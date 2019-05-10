FROM ruby:2.6.3-alpine

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev \
      yarn \
      chromium \
      chromium-chromedriver \
      git \
      postgresql-client
RUN bundle config build.nokogiri --use-system-libraries

ARG UID=1000
ARG GID=1000
ENV USER_ID=$UID
ENV GROUP_ID=$GID
RUN addgroup -g ${GROUP_ID} -S app && adduser -u ${USER_ID} -S app -G app

RUN mkdir /app && chown -R app:app /app

USER app

WORKDIR /app

EXPOSE 3000

ENV BUNDLE_PATH /gems

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
