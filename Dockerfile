FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o main .

FROM scratch

COPY --from=builder /app/main /main

ENTRYPOINT ["/main"]
