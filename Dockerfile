# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.4.4
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /rails

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development test"

FROM base as build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential git libpq-dev libvips pkg-config libyaml-dev && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN SECRET_KEY_BASE_DUMMY=1 DATABASE_URL=postgresql://user:pass@localhost:5432/dbname TEST_DATABASE_URL=postgresql://user:pass@localhost:5432/dbname ./bin/rails assets:precompile

FROM base

# Install runtime dependencies (without build tools)
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl libvips postgresql-client libyaml-0-2 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails

USER rails:rails

ENTRYPOINT ["/rails/docker-entrypoint.sh"]
EXPOSE 3001
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3001", "--environment=production"]

