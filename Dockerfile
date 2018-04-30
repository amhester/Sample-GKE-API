FROM alpine:3.5

ADD ./api /

ENTRYPOINT ["set -e", "exec \"$@\""]

CMD ["/api"]