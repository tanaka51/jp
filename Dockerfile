FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y nodejs \
  build-essential \
  libpq-dev \
  libvips

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
