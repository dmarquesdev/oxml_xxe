FROM ruby:2.3.5-slim

RUN mkdir /oxml_xxe

COPY . /oxml_xxe/

WORKDIR /oxml_xxe

RUN apt-get update && \
    apt-get install -y make libsqlite3-dev libxslt-dev libxml2-dev zlib1g-dev gcc && \
    apt-get clean && \
    bundle install
EXPOSE 4567
ENTRYPOINT ["ruby", "server.rb", "-o", "0.0.0.0"]
