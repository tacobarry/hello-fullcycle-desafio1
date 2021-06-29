FROM golang:1.12-alpine as build_app

WORKDIR /app/fullcyclerocks

COPY src .

RUN go build -o ./out/hello-fullcycle-rocks .

FROM scratch

WORKDIR /app/hello-fullcycle-rocks

COPY --from=build_app /app/fullcyclerocks/out/hello-fullcycle-rocks /app/hello-fullcycle-rocks

CMD [ "./hello-fullcycle-rocks" ]
