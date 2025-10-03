# ========== Parms ==========
ARG CARLA_VERSION=0.9.15
ARG ADDITIONAL_MAPS_VERSION=0.9.15
ARG BASE_IMAGE=carlasim/carla:${CARLA_VERSION}

# ========== Base Image ==========
FROM ${BASE_IMAGE}

# ========== Install Tools ==========
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# ========== Download Maps and import ==========
USER carla
WORKDIR /home/carla

RUN set -eux; \
    mkdir -p Import && cd Import && \
    curl -L -o AdditionalMaps_${ADDITIONAL_MAPS_VERSION}.tar.gz \
        https://carla-releases.s3.us-east-005.backblazeb2.com/Linux/AdditionalMaps_${ADDITIONAL_MAPS_VERSION}.tar.gz && \
    cd .. && \
    bash ImportAssets.sh && \
    rm -f Import/AdditionalMaps_${ADDITIONAL_MAPS_VERSION}.tar.gz

# keep dir
WORKDIR /home/carla
