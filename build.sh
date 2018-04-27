#! /bin/bash

if [ ! -e ./Gemfile.lock ]
then
    docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.5.1-alpine bundle install
fi

docker volume rm slack-calendar-token

if [ "$(docker volume list -q --filter name=slack-calendar-token)" == "" ]; then
    echo "Yum cache not found. Creating new cache..."
    docker volume create slack-calendar-token
fi

docker build -t ruby/slack-wfh:1.0.0 .

docker image prune -f