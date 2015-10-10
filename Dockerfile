FROM    alpine:3.2


RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories 

RUN     apk --update add curl jq bc

ADD     ./forward.sh /forward.sh


CMD     /forward.sh
