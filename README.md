# azure-iot-hub-client-sdk
sample run azure iot hub client sdk on docker 

## docker file build

docker build -t azure-iot-hub-client-sdk .

## create docker container create

docker run -it -d --name azure-iot-hub-client-sdk azure-iot-hub-client-sdk

## run bash and check container setting

docker exec -it azure-iot-hub-client-sdk bash

# 注釈
Python3.5 3.6にするとapt-get install pythonx.x-dev でパッケージが見つからないエラーが発生します。
パッケージリポジトリを追加すれば解消されそうですが、検証していません。
