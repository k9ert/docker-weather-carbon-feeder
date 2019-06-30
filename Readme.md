simple script forwarding weather-data to graphite

    docker build . -t weather-carbon-feeder
    docker run -it \
      -e NODERED_HOST='192.168.178.XX' \
      weather-carbon-feeder