FROM torizon/qt6-wayland:3.2

RUN set -eux ; \
    apt-get update ; \
    apt-get upgrade -y ; \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    git \
    python3 \
    wget \
    xz-utils \
    libfontconfig1-dev \
    libgl1-mesa-dev \
    libglx-dev \
    libwayland-dev \
    qmake6 \
    qml6-module-* \
    qt6-base-dev \
    qt6-base-dev-tools \
    qt6-declarative-dev \
    qt6-l10n-tools \
    qt6-tools-dev \
    qt6-websockets-dev \
    qt6-shadertools-dev

WORKDIR /source

COPY . .

RUN set -eux ; \
    cmake -DCMAKE_BUILD_TYPE=MinSizeRel -S /source -B /app

WORKDIR /app

RUN set -eux ; \
    cmake --build . --parallel

RUN apt-get install -y --no-install-recommends \
    imx-gpu-viv-wayland ; \
    apt-get autoremove

WORKDIR /

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]