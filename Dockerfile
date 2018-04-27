FROM ruby:2.5.1-alpine

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY quickstart.rb ./

ENTRYPOINT ["ruby", "quickstart.rb"]