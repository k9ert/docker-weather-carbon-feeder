#!/bin/bash

if [ -n $APIKEY ]; then
  APIKEY="&APPID=$APIKEY"
fi

if [ -z $GRAPHITE_HOST ]; then
  GRAPHITE_HOST="not-set"
fi

while [ $# -gt 0 ]; do
  case "$1" in
    -a) 
      APIKEY="&APPID=$2"
      shift 2 ;;
    -g) 
      GRAPHITE_HOST=$2
      echo "GRAPHITE_HOST set to $GRAPHITE_HOST "
      shift 2 ;;
  esac
done

if [ -z $GRAPHITE_HOST -o $GRAPHITE_HOST == "not-set" ]; then
  echo "GRAPHITE_HOST not set exit 2"
  exit 2
fi


while true; do
  PORT=2003
  SERVER=graphite-statsd-ccba9643-1.k9ert.cont.tutum.io
  kelvin=`curl -s "api.openweathermap.org/data/2.5/weather?id=6940463&APPID=f0a082fe2fabfd320d7cd97be1b4b929" | jq .main.temp`
  celsius=`echo  "${kelvin}-273.15"  | bc`
  if [ $(echo " $celsius > -100" | bc) -eq 1 ];  then
    echo "stats.test.outside $celsius `date +%s`" | nc ${GRAPHITE_HOST} ${PORT};
    echo "stats.test.outside $celsius `date +%s`"
  else
    echo "$celsius doesn't look like a proper value .. ommitting"
  fi
  sleep 60
done



