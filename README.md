# midori-todo-example
TODO List example built with midori and Vue.js

Requirements:
- Ruby >= 2.2.6
- Node >= 6.0
- Yarn >= 0.22
- MySQL >= 5.7
- Redis >= 3.2

```
$ bundle install
$ rake db:migrate
$ rake vue:install
$ rake vue:build
$ rake run
```


## Deploy to heroku

```
heroku create
heroku addons:add cleardb
heroku config:add MIDORI_ENV=production PORT=8080
```