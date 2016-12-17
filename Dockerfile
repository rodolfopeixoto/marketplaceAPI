FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /market_place_api
WORKDIR /market_place_api
ADD Gemfile /market_place_api/Gemfile
ADD Gemfile.lock /market_place_api/Gemfile.lock
RUN bundle install
ADD . /market_place_api