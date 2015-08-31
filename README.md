# Twitter Challenge

## Decisions

I used the gem [sferik/twitter](https://github.com/sferik/twitter) because
its read-to-use API authentication, response parsing and my previous experience
with it. It was not necessary due the simplicity of the app, but considering the only
2 hours to build the app... ;)

For authentication I choose Devise Gem.


## <a name="database"></a>Local environment setup instructions

Add your twitter app credentials (`TWITTER_CONSUMER_KEY`, `TWITTER_CONSUMER_SECRET`)
as environment variables, or fill `.env` file.

Setup the database filling up the `config/database.yml` file, there is an example file
`config/database.yml.sample`.


## Basic Heroku deployment instructions

Add heroku in your git remotes with `heroku git:remote -a HEROKU_APP_NAME`. Read
more at [this heroku guide](https://devcenter.heroku.com/articles/git).


## Test suite setup/execution instructions

[Edit the database file](#database) and run `rake db:test:prepare` to finish
your database setup, them run `rake test` to run the tests files.


## TODO

* Add tests to `tweet_with_mentions` helper.
* Improve styles
