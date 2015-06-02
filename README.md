# whitesmith/fiware-orion Dockerfile
This Dockerfile installs and builds [FIWARE][]'s implementation of the
[Publish/Subscribe Context Broker GE][] specification: the
[Orion Context Broker][].


## Prerequisites
This image uses [whitesmith/fiware-orion-deps-docker][] as its parent image.
Since it is not available at the [Docker Hub][] (**yet**), you must build it
manually. Its repo contains the command to do it.

For orchestrating the creation of both containers (Orion and MongoDB), a
`docker-compose.yml` is provided. If you choose to use this approach, you'll
need to install [Docker Compose][] as well ([installation instructions](https://docs.docker.com/compose/install/)).


## Usage
If using this for the first time, run

```
  docker build -t whitesmith/fiware-orion:latest .
```

and it will download and build the latest Orion version and tag the resulting
image as `whitesmith/fiware-orion:latest`.

From now on, just

```
  docker-compose up
```

and you'll have a running Orion instance on port `1026` (HTTP) of your Docker
host, as well as on port `5683/udp` (COAP) <sup>**not tested!**</sup>.


[FIWARE]: http://www.fiware.org/
[Publish/Subscribe Context Broker GE]: https://forge.fiware.org/plugins/mediawiki/wiki/fiware/index.php/FIWARE.OpenSpecification.Data.ContextBroker
[Orion Context Broker]: http://catalogue.fi-ware.eu/enablers/publishsubscribe-context-broker-orion-context-broker
[CentOS Vagrant bootstrap script]: https://github.com/telefonicaid/fiware-orion/blob/e58f021f22224792780908e2eb43d21bf1e62e82/scripts/bootstrap/centos65.sh

[single-process per container]: https://docs.docker.com/articles/dockerfile_best-practices/#run-only-one-process-per-container
[container linking]: https://docs.docker.com/userguide/dockerlinks/

[whitesmith/fiware-orion-deps-docker]: https://github.com/whitesmith/fiware-orion-deps-docker

[Docker Hub]: https://registry.hub.docker.com/
[Docker Compose]: https://docs.docker.com/compose/
