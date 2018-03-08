# azure-iot-hub-client-sdk
sample run azure iot hub client sdk on docker 

## docker file build

docker build -t azure-iot-hub-client-sdk .

## create docker container create

docker run -it -d --name azure-iot-hub-client-sdk azure-iot-hub-client-sdk

## run bash and check container setting

docker exec -it azure-iot-hub-client-sdk bash
