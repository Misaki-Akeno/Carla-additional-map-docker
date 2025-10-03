# Carla-additional-map-docker

The official version of Carla does not provide additional map options; build an image with additional maps through this Dockerfile.

官方版本的carla不提供额外地图选项，通过这个dockerfile构建带额外地图的镜像。

## Usage 使用方式
```shell
docker build \
  --build-arg CARLA_VERSION=0.9.15 \
  --build-arg ADDITIONAL_MAPS_VERSION=0.9.15 \
  -t carla-with-maps:0.9.15 .
```
