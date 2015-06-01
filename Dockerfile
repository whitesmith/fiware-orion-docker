FROM whitesmith/fiware-orion-deps:latest
MAINTAINER José Ribeiro <jlbribeiro@whitesmith.co>

RUN git clone https://github.com/telefonicaid/fiware-orion.git /fiware-orion
WORKDIR /fiware-orion

RUN make install && make clean

EXPOSE 1026
EXPOSE 5683/udp

ENTRYPOINT ["contextBroker", "-fg"]
CMD ["--help"]
