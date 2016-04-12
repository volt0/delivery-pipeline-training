## Deploy

```
heroku login
heroku create
heroku addons:create heroku-postgresql:hobby-dev
git push heroku master
```


## Continuous Delivery

```
sudo gem install travis -v 1.8.2 --no-rdoc --no-ri
# travis setup heroku
travis encrypt $(heroku auth:token) --add deploy.api_key
```
