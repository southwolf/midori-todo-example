#! /usr/bin/env sh

cd frontend
npm i yarn
yarn
npm run build

bundle exec rake db:migrate
bundle exec rake run
