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

RUN rake db:create \
    && rake db:migrate \
    && rake db:seed

# Start reails server and bind it to 0.0.0.0
# Remove this CMD if using docker-compose
CMD ["rails", "server", "-b", "0.0.0.0"]