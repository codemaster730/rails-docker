FROM ubuntu
MAINTAINER axiom88guru(axiom88guru@gmail.com)
# Configuration for app below.
# Run upgrades
RUN apt-get update

# Install basic packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Ruby
RUN apt-get -qq -y install ruby-full
RUN gem install bundler --no-ri --no-rdoc
RUN gem install foreman

# Install rails-new-docker
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/axiom88-guru/rails-docker.git /app
RUN bundle install --without development test

# Run rails-new-docker
ENV SECRET_KEY_BASE dockerkeybase
ENV RAILS_ENV production
EXPOSE 5959
CMD foreman start -f Procfile
