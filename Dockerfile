FROM ruby:3.3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Install gems
COPY Gemfile* ./
RUN bundle install

# Copy app files
COPY . .

# Start server
CMD ["rails", "server", "-b", "0.0.0.0"]
