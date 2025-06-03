#!/bin/bash -e
# create or migrate existing database
RAILS_ENV=production ./bin/rails db:prepare

exec "${@}"
