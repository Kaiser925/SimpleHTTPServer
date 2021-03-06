FROM golang:1.15 as builder

WORKDIR src

COPY . .

RUN go build

FROM busybox:glibc

COPY --from=builder /go/src/SimpleHTTPServer /usr/bin/SimpleHTTPServer

EXPOSE 8765

VOLUME ["/data"]

CMD ["SimpleHTTPServer", "--bind","0.0.0.0","--directory", "/data"]
