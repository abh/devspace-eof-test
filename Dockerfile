FROM alpine:3.11

WORKDIR /app
USER root
RUN addgroup dstest && adduser -D -G dstest dstest

USER dstest

# kaniko adds this as root despite USER dstest ...
ADD . /app

USER root
# I don't know why kaniko creates the directory with 777 permissions...
RUN chmod 775 /app && ls -latr
RUN date > /app/.timestampds

# Comment this out to get permission errors (without a big file
# upload) and "EOF" errors with a big file upload included.
RUN chown -R dstest:dstest /app

# make a file that's owned by root anyway
# RUN date > /app/.timestamp


USER dstest

RUN  ls -latr

CMD sleep 86400
