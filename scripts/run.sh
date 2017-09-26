#! /usr/bin/env sh

bundle exec rake db:migrate
bundle exec rake vue:install
bundle exec rake vue:build
bundle exec rake run
