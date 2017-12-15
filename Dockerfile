FROM alpine:3.5

ADD ./api /
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN apk --update add ca-certificates

ENTRYPOINT ["set -e", "exec \"$@\""]

CMD ["/api"]