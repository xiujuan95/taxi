FROM golang:1.11-alpine AS build

# Install tools required for project
# Run `docker build --no-cache .` to update dependencies
RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

FROM ubuntu
ENTRYPOINT ["/bin/bash", "-c", "mkdir -p /tmp/demo"]
RUN dd if=/dev/zero of=bigFile.txt bs=20M count=1000
ENTRYPOINT ["/bin/bash", "-c", "echo end"]