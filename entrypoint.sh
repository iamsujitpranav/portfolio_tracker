#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Run migrations
bundle exec rails db:migrate

# Seed data
bundle exec rails db:seed

# Start the Rails server
exec "$@"
