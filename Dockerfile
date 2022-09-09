FROM ruby:3.1.2-alpine

RUN apk add --update --no-cache \
    gcc g++ make libffi-dev \
    libpq postgresql-dev tzdata

WORKDIR /d-api

COPY Gemfile* ./

RUN bundle update --bundler

RUN bundle install

RUN gem install foreman

COPY . .

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
