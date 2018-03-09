FROM python:3.4
ARG PY_VERSION="3.4"
RUN echo $PY_VERSION

RUN apt-get -y update && apt-get install -y --no-install-recommends \
    git-core \
    sudo \
    cmake \
    build-essential \
    curl libcurl4-openssl-dev \
    libssl-dev uuid-dev \
    libboost-dev

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# create and set work directory
RUN mkdir /code
WORKDIR /code

# install Microsoft Azure IoT SDKs for Python
RUN git clone --recursive https://github.com/Azure/azure-iot-sdk-python.git
RUN apt-get -y update \
    && cd azure-iot-sdk-python/build_all/linux/ \
    && ./setup.sh --python-version $PY_VERSION \
    && ./build.sh --build-python $PY_VERSION \
    && cd ././

