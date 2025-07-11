FROM alpine:latest

# Instalamos sólo el cliente SSH
RUN apk add --no-cache openssh-client

# Exponemos el puerto interno (opcional, pero mejora detección)
EXPOSE 8888

# Definimos el comando por defecto en formato JSON-array
CMD [
  "ssh",
  "-o", "StrictHostKeyChecking=no",
  "-o", "ServerAliveInterval=60",
  "-o", "ServerAliveCountMax=3",
  "-o", "ExitOnForwardFailure=yes",
  "-R", "0.0.0.0:8888:localhost:7777",
  "serveo.net"
]
