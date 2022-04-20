# Blog App Local Development Setup

This page provides guidance on how to get the blog app up and running locally using docker compose.

## First-time setup
After pulling the code from Github, there are only a few commands necessary to get the app up and running locally.
* `docker-compose build`
* `docker-compose up`
  * Wait for the following output from the DB container: "PostgreSQL init process complete; ready for start up"
* In a separate terminal execute the following
  * `docker-compose run web rake db:create`