FROM golang:1.7-alpine as builder
ADD . /home
        
WORKDIR /home

RUN go build main.go 

FROM scratch
WORKDIR  /home
COPY --from=builder /home/main .
CMD ["./main"]