# Lang code UTF-8
FROM python:3.5.5
ENV PYTHON_VERSION="3"

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

# Azure IoT hub device connection string env set
ENV DEVICE_CONNECTION HostName=detection-iot-hub.azure-devices.net;DeviceId=detection-rsp;SharedAccessKey=USpf8KO8XmPXNSO9W1g2PyMdLp6T54mPRzcyIk052nI=
RUN echo $DEVICE_CONNECTION

# install 
RUN git clone --recursive https://github.com/Azure/azure-iot-sdk-python.git
RUN apt-get -y update \
    && cd azure-iot-sdk-python/build_all/linux/ \
    && ./setup.sh --python-version $PYTHON_VERSION \
    && ./build.sh --build-python $PYTHON_VERSION \
    && cd ././

# IoT Hub Raspberry Pi 3 Client application sample clone
# RUN git clone https://github.com/Azure-Samples/iot-hub-python-raspberrypi-client-app.git

# setup client app
# RUN cd ./iot-hub-python-raspberrypi-client-app \
#     && chmod u+x setup.sh \
#     && ./setup.sh -p $PYTHON_VERSION

# CMD python /code/iot-hub-python-raspberrypi-client-app/app.py $DEVICE_CONNECTION
