# Planet Reviews

Rails application initialized from the [make_it_so](https://github.com/LaunchAcademy/make_it_so) gem.

## Getting Started

```
$ git clone git@github.com:LaunchAcademy/planet_reviews.git
$ cp .env.example .env
$ bundle
$ rake db:create db:migrate db:seed
$ rails server
```

In another tab, start Sidekiq to handle background jobs

```
$ bundle exec sidekiq -q default -q mailers
```
