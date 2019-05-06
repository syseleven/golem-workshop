FROM golang:1.11.5 AS build

WORKDIR /go/src/app

COPY . .

ENV CGO_ENABLED 0

RUN go build -v -o hello-svc

FROM scratch

COPY --from=build /go/src/app/hello-svc /hello-svc

EXPOSE 3001

ENTRYPOINT [ "/hello-svc" ]
