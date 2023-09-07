FROM ruby:3.2.2

ENV APP_HOME=/var/www/sof

WORKDIR $APP_HOME
COPY Gemfile Gemfile.lock $APP_HOME

RUN gem install bundler && bundle install

COPY . $APP_HOME
RUN mkdir -p tmp/pids tmp/sockets log

VOLUME $APP_HOME/tmp

CMD ["bundle", "exec", "unicorn", "-c", "unicorn.conf.rb"]
