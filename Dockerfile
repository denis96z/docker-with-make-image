FROM ubuntu:latest as base
RUN apt-get update \
        && apt-get install -y make

FROM docker:latest
COPY --from=base /etc/ld.so.conf.d /etc/ld.so.conf.d
COPY --from=base /etc/ld.so.conf.d/x86_64-linux-gnu.conf /etc/ld.so.conf.d/x86_64-linux-gnu.conf
COPY --from=base /lib/x86_64-linux-gnu/*.so /lib/x86_64-linux-gnu/
COPY --from=base /usr/lib/x86_64-linux-gnu/* /usr/lib/x86_64-linux-gnu/
COPY --from=base /lib/x86_64-linux-gnu/* /lib/x86_64-linux-gnu/
COPY --from=base /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=base /usr/bin/make /usr/bin/make
