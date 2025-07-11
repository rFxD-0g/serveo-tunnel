FROM alpine:latest

# Instala solo el cliente SSH
RUN apk add --no-cache openssh-client

# (Opcional) Pre-aprueba la clave de Serveo para no preguntar fingerprint
RUN ssh-keyscan serveo.net >> /etc/ssh/ssh_known_hosts

# Expone el puerto interno (no estrictamente necesario, pero ayuda a detectar)
EXPOSE 8888

# Shell form: todo en una sola línea. Así no rompe el parser de Dockerfile.
CMD ssh -N \
    -o StrictHostKeyChecking=no \
    -o ServerAliveInterval=60 \
    -o ServerAliveCountMax=3 \
    -o ExitOnForwardFailure=yes \
    -R 0.0.0.0:8888:localhost:7777 \
    serveo.net
