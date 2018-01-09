# SB Cuervos FC

SB Cuervos is a web application created to share the news about the amateur
soccer team SB Cuervos FC and a tool for the communication between coaches and players.

# Deployment

The application is deployed on Heroku:
```
http://sbcuervos.herokuapp.com/
```

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run RSpec test suite to verify that everything is working correctly:

```
$ bundle exec rspec
```

If the tests passes, you'll be ready to run the app in a local server:

```
$ rails server
```
