FROM ruby:2.7.2
WORKDIR /opt/app

RUN gem install bundler:2.2.0

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle

COPY . .
