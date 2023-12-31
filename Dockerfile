FROM ruby:3.0.6-alpine

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

# install essential packages
RUN apk add --update --no-cache \
    build-base \
    curl \
    git \
    sqlite-dev \
    mysql-client \
    mysql-dev \
    libstdc++

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
# install gems
RUN bundle install

# copy over project
COPY . .

EXPOSE 3000

CMD ["./bin/rails", "server","-p", "3000", "-b", "0.0.0.0"]
