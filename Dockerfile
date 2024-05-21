FROM ruby:3.1.4

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs
RUN mkdir /votacao
WORKDIR /votacao
ADD Gemfile /votacao/Gemfile
ADD Gemfile.lock /votacao/Gemfile.lock
RUN bundle install
ADD . /votacao