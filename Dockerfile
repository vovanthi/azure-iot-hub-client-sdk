FROM ubuntu:16.04

ARG PY_VERSION="3.5"
RUN echo $PY_VERSION

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    git-core \
    python${PY_VERSION} \
    python${PY_VERSION}-dev \
    python3-pip \
    libboost-all-dev \
    libcurl4-openssl-dev

RUN rm -f /usr/bin/python
RUN ln -s /usr/bin/python3.5 /usr/bin/python
RUN python -m pip install azure-iothub-device-client

RUN python -c "import iothub_client"
