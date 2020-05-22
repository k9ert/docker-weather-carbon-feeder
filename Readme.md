simple script forwarding weather-data to graphite

    docker build . -t k9ert/weather-feeder
    
    # Nodered example
    docker run -it \
      -e NODERED_HOST='192.168.178.XX' \
      k9ert/weather-feeder
    
    # example for hostedgraphite.com
    docker run -it \
      -e GRAPHITE_HOST='6ee324c3.carbon.hostedgraphite.com' \
      -e GRAPHITE_PREFIX='b23c8ee2-0465-4e60-9d90-2da5a6685f6d' \
      k9ert/weather-feeder
    
    # push to dockerhub
    docker push k9ert/weather-feeder

# Events / Annotations

## Grafana
Grafana has a annotations store which can be used via the CTRL-key.
For details check https://grafana.com/docs/reference/annotations/

## Graphite

    # in general
    curl -X POST "http://graphite/events/"
    -d '{ "what": "Event - deploy", "tags": ["deploy"], "when": 1467844481,
    "data": "deploy of master branch happened at Wed Jul  6 22:34:41 UTC 2016" }'

    # for hostedgraphite
    curl -X POST https://YOUR-API-KEY@api.hostedgraphite.com/api/v1/annotations/events/ -d \
    "&title=New Super-duper Feature\
    &tag=deployment\
    &tag=feature"