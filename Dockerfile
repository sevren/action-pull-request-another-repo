FROM golang:1.16-alpine3.13

RUN apk update && \
    apk upgrade && \
    apk add build-base && \
    apk add git

RUN curl -Lo /tmp/ghlinux.tar.gz https://github.com/cli/cli/releases/download/v2.14.4/gh_2.14.4_linux_amd64.tar.gz \
  && tar --strip-components=1 -xf /tmp/ghlinux.tar.gz \
  && rm /tmp/ghlinux.tar.gz \
  && chmod a+x ./bin/gh \
  && mv ./bin/gh /usr/local/bin/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]