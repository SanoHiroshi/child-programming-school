FROM ruby:2.4.0

MAINTAINER hiroshi sano "hiroshi.sano0711@gmail.com"

ENV APP_ROOT /rails-app/child-programming-school

RUN apt-get update && apt-get install -y nodejs npm build-essential zlib1g-dev libpq-dev imagemagick cron && rm -rf /var/lib/apt/lists/* \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./rails-app/child-programming-school/. $APP_ROOT

WORKDIR /tmp
ADD ./rails-app/child-programming-school/Gemfile Gemfile
ADD ./rails-app/child-programming-school/Gemfile.lock Gemfile.lock

WORKDIR $APP_ROOT
RUN bundle install -j 4

EXPOSE 3000
