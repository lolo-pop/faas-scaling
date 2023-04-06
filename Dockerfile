FROM golang:1.15-alpine AS builder
WORKDIR /go/src/faas-scaling
COPY . .
RUN go build -o faas-scaling

FROM alpine
WORKDIR /root/
COPY --from=builder /go/src/faas-scaling/faas-scaling .
CMD ["./faas-scaling"]