FROM ruby:3-slim

WORKDIR /app

RUN apt-get update && apt-get -y upgrade && \
    apt-get install --no-install-recommends -y \
        #build-essential \
        # git is required for installing gems
        git

ADD ./Gemfile /app/
ADD ./Gemfile.lock /app/
ADD ./omniauth-zooniverse.gemspec /app/
ADD ./ /app

RUN bundle config --global jobs `cat /proc/cpuinfo | grep processor | wc -l | xargs -I % expr % - 1`
RUN bundle install


