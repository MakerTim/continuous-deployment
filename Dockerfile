FROM docker:dind

WORKDIR /srv
RUN apk add --no-cache git \
    && git config --global --add safe.directory /build \
    && mkdir /root/.ssh/ \
    && ssh-keyscan github.com >> /root/.ssh/known_hosts \
    && ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts \
    && ssh-keyscan gitlab.com >> /root/.ssh/known_hosts

COPY src/entry.sh /srv/entry.sh
RUN mkdir "/build"

# Every hour
ENV INTERVAL=3600
# Hours in a year
ENV LOOP_COUNT=876581277
ENTRYPOINT ["/srv/entry.sh"]

VOLUME /build
WORKDIR /build
