FROM ruby:2.6.6-alpine

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

COPY ./docker/development/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir -p /app/public/packs && chown -R app:app /app


USER app

WORKDIR /app

EXPOSE 3000

ENV BUNDLE_PATH /gems

VOLUME ["/app/public/packs"]

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
