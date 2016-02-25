FROM    alpine:3.2


RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
apk --update add jq curl bc runit@testing


# For all services
COPY services /etc/service/

CMD ["runsvdir", "/etc/service"]
