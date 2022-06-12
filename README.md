# Blog App Local Development Setup

This page provides guidance on how to get the blog app up and running locally using docker compose.

## First-time setup
After pulling the code from Github, there are only a few commands necessary to get the app up and running locally.
* `docker-compose build`
* `docker-compose up`
  * Wait for the following output from the DB container: "PostgreSQL init process complete; ready for start up"
* In a separate terminal execute the following
  * `docker-compose run web rake db:create`
* After the databases are successfully created, the site should be available
  * <http://localhost:5000>

## `docker-compose build` is needed anytime the following is updated
* `Dockerfile`
* `Gemfile`
  * After a `Gemfile` update, also need `docker-compose run --rm web bundle update` before `docker-compose up`

## Running RSpec tests
First, start up the application
`docker-compose up`
Then, in another terminal, start a bash session in the web container
`docker-compose run web bash`
Finally, inside the bash session you can execute the targeted test(s)
`rspec spec/path/to/target_file_spec.rb`

## Rails-related commands
* Viewing application routes that are filtered (e.g. -g articles)
  * `rails routes -g articles`
* Generate a new controller 
  * `rails g controller ControllerName action1 action2 ...`
    * e.g. `rails g controller Articles index`
* Generate a new serializer
  * First install the jsonapi-serializer gem in `Gemfile`
    * `gem 'jsonapi-serializer'`
  * Then in a web container bash shell
    * `bundle`
    * `rails g serializer [serializer_name] [attribute-1 attribute-2 ...]`
    * e.g. `rails g serializer article title content slug`

## PGAdmin
After starting all services with `docker-compose up`, open up the [PGAdmin Web UI](http://localhost:15432)
* For the UI login, use the `environment` values found in the `pgadmin` service in `docker-compose.yml`
* Once logged in to the UI, right-click __Server__ and select __Create__ > __Server__
  * Under __General__, provide a __Name__ (e.g. docker-postgres)
  * Under __Connection__
    * __Host name/address__: pgadmin container name from `docker-compose.yml`
    * __Port__: 5432
    * __Maintenance database__: from `config/database.yml` (default& > username)
    * __Username__: from `config/database.yml` (default& > username)
    * __Password__: from `config/database.yml` (default& > password)
  * Click on __Save password__ option
* Once connected to the local server, tables can be viewed under:
  * __Databases__ > __blog_app_development__ > __Schemas__ > __Public__ > __Tables__
* To perform CRUD operations against a table, right-click the table and select select an option under __Scripts__