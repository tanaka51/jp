FROM ruby:3.1.0-buster

RUN (curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | apt-key add -) && \
    echo "deb https://deb.nodesource.com/node_16.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
        apt-get update && apt-get install -y nodejs lsb-release

RUN (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install -y yarn

RUN apt-get update -qq && apt-get install -y nodejs \
  build-essential \
  libpq-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app

ARG MASTER_KEY
ENV RAILS_MASTER_KEY=${MASTER_KEY}

ARG RAILS_ENV
ENV RAILS_ENV=${RAILS_ENV}

RUN bin/rails assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
