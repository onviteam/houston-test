# Houston example repository

This is a basic Rails application to aid in discussions and implementations around Houston.

You have a limited subset of the Houston models:

- Category
- Item
- Portion

These have associations as can be found in the erd diagram.

Houston syncs data from external pos systems into Onvi

All three classes have an attribute of `external_id` this is to be thought of as the id in an external system.  We can use this to lookup instances from the third party system.

## Installation

Run:
    `bundle`
    `bundle exec rake db:migrate db:test:prepare`
    `rspec`
    `rubocop`

Alternativly you can use docker
    `docker-compose build`
    `docker-compose run houston bundle exec rake db:create db:migrate db:seed db:test:prepare`
    `docker-compose run -e "RAILS_ENV=test" houston bundle exec rspec`
    `docker-compose run -e "RAILS_ENV=test" houston bundle exec rubocop`

## Tasks

### First task

Initally we would like to seed the database with the fixture data supplied by lightspeed.  Their documentation can be found:

https://developers.lightspeedhq.com/resto-api/endpoints/inventoryproductgroup/

We should use the `MenuImporter` class as an inital entrypoint.

Things to think about:
- inconsistant api responses
- handling of floats in ruby
- allowing for paginated responses

### Bonus task

We have another POS company that we wish to integrate with.  How might we re-organise the `MenuImporter` class to allow for different API payloads?

Are there benefits of sharing code?  What pitfalls do we need to be careful of?

The new api payload can be seen `./spec/fixtures/ikentoo/`