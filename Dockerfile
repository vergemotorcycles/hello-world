FROM ghcr.io/vergemotorcycles/torizon-qt:latest

ARG SRC_DIR

RUN set -eux ; \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y --no-install-recommends \
    libgles2-mesa-dev \
    libxkbcommon-dev \
    git

WORKDIR /source

COPY ${SRC_DIR} .

RUN set -eux ; \
    cmake  \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -GNinja \
    -S . \
    -B /build

WORKDIR /build

RUN set -eux ; \
    cmake --build . --parallel ; \
    cmake --install .

FROM torizon/qt6-wayland:3.2

ARG SRC_DIR

COPY --from=0 /usr/local/Qt-6.8.0 /usr/local/Qt-6.8.0 

RUN set -eux ; \
    apt-get update ; \
    apt-get install -y --no-install-recommends \
    imx-gpu-viv-wayland

COPY ${SRC_DIR}/entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
