FROM    dockage/alpine-runit:3.7

RUN apk --update add jq curl bc runit@testing

# For all services
COPY services /etc/service/

CMD ["runsvdir", "/etc/service"]

