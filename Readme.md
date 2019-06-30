simple script forwarding weather-data to graphite

    docker build . -t k9ert/weather-feeder
    
    # Nodered example
    docker run -it \
      -e NODERED_HOST='192.168.178.XX' \
      k9ert/weather-feeder
    
    # example for hostedgraphite.com
    docker run -it \
      -e GRAPHITE_HOST='6ee324c1.carbon.hostedgraphite.com' \
      -e GRAPHITE_PREFIX='b23c8ee2-1465-4e60-9d90-2da5a6685f6d' \
      k9ert/weather-feeder
    
    # push to dockerhub
    docker push k9ert/weather-feeder