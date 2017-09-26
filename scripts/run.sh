#! /usr/bin/env sh

cd ./frontend; yarn
cd ./frontend; npm run build

bundle exec rake db:migrate
bundle exec rake run
