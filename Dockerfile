FROM ruby:2.4
EXPOSE 3000 80

WORKDIR app/
COPY /src /app

RUN bundle install

ENV EXECJS_RUNTIME RubyRacer
CMD cd app/ && rails s
