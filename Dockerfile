FROM golang:1.12-alpine AS builder

RUN apk update && apk add git

RUN go get github.com/rrreeeyyy/prometheus-http-sd
RUN go get github.com/prometheus/prometheus/cmd/prometheus

RUN apk add supervisor

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]