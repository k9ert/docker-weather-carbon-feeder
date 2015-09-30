FROM        ubuntu:14.04

RUN     apt-get -y update 
RUN     apt-get -y install curl jq bc

ADD     ./forward.sh /forward.sh


CMD     /forward.sh
