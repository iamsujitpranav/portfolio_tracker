FROM ubuntu:22.04

RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/us.archive.ubuntu.com/g' /etc/apt/sources.list

# Install necessary dependencies

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client



RUN apt-get update
# Install bundler

FROM ruby:3.2.2

# Use the specific Redis version you need
# FROM redis:3.2

ENV RAILS_ROOT /portfolio-tracker

WORKDIR $RAILS_ROOT

RUN gem install bundler -v 2.4.19

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install project dependencies
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Set up permissions for the wait-for-it script
RUN chmod +x /portfolio-tracker/wait-for-it.sh

# Copy the entry point script into the container
COPY entrypoint.sh /usr/bin/

# Make the entry point script executable
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entry point
ENTRYPOINT ["entrypoint.sh"]

# Expose port 3000 for the Rails server
EXPOSE 3000
EXPOSE 6379

# Start the Rails server using Puma (adjust if you are using a different web server)
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
