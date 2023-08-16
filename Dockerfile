FROM golang:alpine AS builder

WORKDIR /app

COPY main.go .

RUN go run main.go && \    
    go mod init greeter && \    
    go build -ldflags="-s -w" -o main

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD [ "./main"]