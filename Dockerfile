FROM ruby:2.4

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    nodejs \
    imagemagick libmagickwand-dev \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

COPY . /myapp