FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Set the environment variables
ENV DEBIAN_FRONTEND=noninteractive
ARG DOCKERVERSION=26.1.3

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates curl file \
    build-essential \
    autoconf automake autotools-dev libtool xutils-dev && \
    rm -rf /var/lib/apt/lists/*

ARG SSL_VERSION=3.2.1
# RUN curl https://www.openssl.org/source/openssl-3.2.1.tar.gz

# RUN curl https://www.openssl.org/source/openssl-3.2.1.tar.gz

# RUN curl https://www.openssl.org/source/openssl-${SSL_VERSION}.tar.gz

# RUN curl https://www.openssl.org/source/openssl-3.2.1.tar.gz

RUN curl https://www.openssl.org/source/openssl-${SSL_VERSION}.tar.gz -O && \
    tar -xzf openssl-${SSL_VERSION}.tar.gz && \
    cd openssl-${SSL_VERSION} && ./config && make depend && make install && \
    cd .. && rm -rf openssl-${SSL_VERSION}*

ENV OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1

# install toolchain
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y

ENV PATH=/root/.cargo/bin:$PATH

RUN curl -O https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz && \
    tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker && \
    rm docker-${DOCKERVERSION}.tgz