FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y \
  curl \
  build-essential \
  libpq-dev && \
  curl -fsSL https://deb.nodesource.com/setup_15.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

WORKDIR /practic_project
COPY Gemfile /practic_project/Gemfile
COPY Gemfile.lock /practic_project/Gemfile.lock
COPY package.json /practic_project/package.json
COPY yarn.lock /practic_project/yarn.lock

RUN bundle check || bundle install --jobs 5
RUN yarn install --check-files
COPY . /practic_project

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
