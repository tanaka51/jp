FROM ruby:3.1.0

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

CMD ["rails", "server", "-b", "0.0.0.0"]
