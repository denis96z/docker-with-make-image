FROM docker:latest
RUN apk add git make rsync
RUN apk add --update --no-cache openssh sshpass
