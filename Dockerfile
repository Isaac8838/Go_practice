FROM golang:1.21-alpine

WORKDIR /usr/src/app

COPY . .

EXPOSE 8080

RUN apk add git && \
    go install -v golang.org/x/tools/gopls@latest && \
    go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest && \
    go install github.com/pressly/goose/v3/cmd/goose@latest && \
    apk add gcc

ENV CGO_ENABLED=1