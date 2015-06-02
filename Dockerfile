FROM whitesmith/fiware-orion-deps:latest
MAINTAINER José Ribeiro <jlbribeiro@whitesmith.co>

# Pinning commit to guarantee fiware-orion-deps matches the current dependencies.
ENV FIWARE_ORION_COMMIT_VERSION 479e0bd24f6b37e76fb84992996f71dee0dc0292
RUN git clone https://github.com/telefonicaid/fiware-orion.git /fiware-orion && \
    cd /fiware-orion && \
    git reset --hard $FIWARE_ORION_COMMIT_VERSION

WORKDIR /fiware-orion

RUN make install && make clean

EXPOSE 1026
EXPOSE 5683/udp

ENTRYPOINT ["contextBroker", "-fg"]
CMD ["--help"]
