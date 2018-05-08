FROM ruby:2.5

# Install dependencies:
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /drkiq
RUN mkdir -p $INSTALL_PATH

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Provide dummy data to Rails so it can pre-compile assets.
RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["$INSTALL_PATH/public"]

CMD bundle exec rails s
