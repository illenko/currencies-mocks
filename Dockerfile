FROM golang:1.22-alpine3.19 AS builder
WORKDIR /build
COPY . .
RUN go build  -o /build/main

FROM ubuntu:20.04
WORKDIR /app
COPY --from=builder /build/main .

EXPOSE 8080
ENTRYPOINT ["/app/main"]