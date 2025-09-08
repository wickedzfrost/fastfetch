FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/wickedzfrost/fastfetch.git .

RUN mkdir build && \
    cd build && \
    cmake DBUILD_TESTS=ON .. && \
    cmake --build . --target fastfetch j$(nproc) && \

RUN cp build/fastfetch /usr/local/bin/

CMD ["fastfetch"]
