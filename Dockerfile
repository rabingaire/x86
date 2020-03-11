FROM i386/alpine

RUN apk add --no-cache make gcc nasm

WORKDIR /app

ENTRYPOINT [ "make" ]
