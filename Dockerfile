FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    pkg-config \
    libpci-dev \
    libvulkan-dev \
    libwayland-dev \
    libxrandr-dev \
    libxcb-randr0-dev \
    libdconf-dev \
    libdbus-1-dev \
    libmagickcore-dev \
    libxfconf-0-dev \
    libsqlite3-dev \
    librpm-dev \
    libegl-dev \
    libglx-dev \
    libosmesa6-dev \
    ocl-icd-opencl-dev \
    libnm-dev \
    libpulse-dev

RUN rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/wickedzfrost/fastfetch.git .

RUN mkdir build && \
    cd build && \
    cmake -DBUILD_TESTS=ON .. && \
    cmake --build . --target fastfetch -j$(nproc)

RUN cp build/fastfetch /usr/local/bin/

CMD ["fastfetch"]
