FROM alpine:latest

RUN apk add --no-cache openssh-client

CMD [
  "ssh",
  "-o", "StrictHostKeyChecking=no",
  "-o", "ServerAliveInterval=60",
  "-o", "ServerAliveCountMax=3",
  "-o", "ExitOnForwardFailure=yes",
  "-R", "0.0.0.0:8888:localhost:7777",
  "serveo.net"
]
