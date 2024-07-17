# Use the Elixir 1.14 with OTP 24 as the base image
FROM elixir:1.14-otp-24

# Install inotify-tools and other necessary packages
RUN apt-get update && \
    apt-get install -y inotify-tools build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the environment variable
ENV MIX_ENV=prod

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory in the container
WORKDIR /app

# Copy the mix.exs and mix.lock files
COPY mix.exs mix.lock ./

# Get production dependencies
RUN mix deps.get --only prod

# Copy the rest of the application code
COPY . .

# Compile the project
RUN mix compile

# Create a release
RUN mix release

# Set the entrypoint
ENTRYPOINT ["/app/_build/prod/rel/flex_site/bin/flex_site"]
CMD ["start"]