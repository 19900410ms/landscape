FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \
    nodejs

RUN mkdir /landscape

ENV APP_ROOT /landscape
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT