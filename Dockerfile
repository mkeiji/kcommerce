FROM ruby:2.4

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
    nodejs \
    imagemagick libmagickwand-dev \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

# Run the image as a non-root user
RUN useradd -m myuser
USER myuser

# Start reails server and bind it to 0.0.0.0
CMD ["rails", "server", "-b", "0.0.0.0"]