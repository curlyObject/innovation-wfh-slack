#! /bin/bash

docker run -it --rm -v $(pwd)/client_secrets.json:/usr/src/app/client_secrets.json -v slack-calendar-token:/usr/src/app/token/ ruby/slack-wfh:1.0.0