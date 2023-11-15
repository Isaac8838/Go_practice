FROM golang:1.21-bookworm

RUN apt update && \
    apt-get install -y git && \ 
    apt-get install -y build-essential

# ENV CGO_ENABLED=0

WORKDIR /app

COPY . .

EXPOSE 8080

RUN go install golang.org/x/tools/gopls@latest && \
    go install github.com/sqlc-dev/sqlc/cmd/sqlc@latest && \
    go install github.com/pressly/goose/v3/cmd/goose@latest

# ENV CGO_ENABLED=1