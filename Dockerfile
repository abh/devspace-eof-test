FROM alpine:3.11

WORKDIR /app
USER root
RUN addgroup dstest && adduser -D -G dstest dstest
RUN apk --no-cache add git

RUN chown dstest:dstest /app

RUN date > /app/.timestamp

RUN chmod 700 /app && ls -latr

USER dstest

RUN git init

ADD . /app

RUN date > /app/.timestampds

RUN  ls -latr

CMD sleep 86400
