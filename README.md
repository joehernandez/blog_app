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


## Running RSpec tests
First, start up the application
`docker-compose up -d`
Then start a bash session in the web container
`docker-compose run web bash`
Finally, inside the bash session you can execute the targeted test(s)
`rspec spec/path/to/target_file_spec.rb`

## Rails-related commands
* Viewing application routes that are filtered (e.g. -g articles)
  * `rails routes -g articles`
* Generate a new controller 
  * `rails g controller ControllerName action1 action2 ...`
    * e.g. `rails g controller Articles index`