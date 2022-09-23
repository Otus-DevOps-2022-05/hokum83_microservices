FROM fluent/fluentd:v0.12

RUN apk add --no-cache --update --virtual .build-deps build-base ruby-dev \
    && gem install faraday --no-rdoc --no-ri -v 1.10.2 \
    && gem install faraday-net_http --no-rdoc --no-ri -v 2.1.0 \
    && gem install elasticsearch --no-rdoc --no-ri -v 7.4.0 \
    && gem install fluent-plugin-elasticsearch --no-rdoc --no-ri --version 1.9.5\
    && gem install fluent-plugin-grok-parser --no-rdoc --no-ri --version 1.0.0 \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY fluent.conf /fluentd/etc
