FROM ubuntu
MAINTAINER axiom88guru(axiom88guru@gmail.com)
# Configuration for app below.
# Run upgrades
RUN apt-get update

# Install basic packages
RUN apt-get -qq -y install git curl build-essential openssl libssl-dev python-software-properties python g++ make
RUN apt-get -qq -y install libsqlite3-dev
RUN apt-get -qq -y install nodejs

# Install Ruby
RUN apt-get -qq -y install ruby-full
RUN gem install bundler --no-ri --no-rdoc
RUN gem install foreman compass

# Install rails-new-docker
WORKDIR /app
RUN git clone https://github.com/axiom88-guru/rails-docker.git /app
RUN bundle install --without development test

# Run rails-new-docker
ENV SECRET_KEY_BASE dockerkeybase
ENV RAILS_ENV production
EXPOSE 5959
CMD foreman start -f Procfile
