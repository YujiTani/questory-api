FROM ruby:3.2.2
ENV LANG C.UTF-8
ENV TZ=Asia/Tokyo
ARG RUBYGEMS_VERSION=3.3.3

RUN apt-get update -qq && apt-get install -y build-essential default-mysql-client vim

RUN mkdir /app
WORKDIR /app

RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem update --system ${RUBYGEMS_VERSION}
RUN bundle install
COPY . /app

COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
