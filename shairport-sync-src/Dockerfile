ARG BUILD_FROM=hassioaddons/ubuntu-base:5.2.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apk add avahi mbedtls \
    && apk add \
        build-base git xmltoman autoconf automake libtool libdaemon-dev popt-dev \
        avahi-dev alsa-lib-dev soxr-dev mbedtls-dev libsndfile-dev libconfig-dev \
    \
    && cd ~ && git clone 'https://github.com/mikebrady/alac.git' \
    && cd alac \
    && autoreconf -i -f \
    && ./configure --prefix=/usr/local \
    && make && make install && ldconfig \
    && cd .. \
    \
    && git clone 'https://github.com/mikebrady/shairport-sync.git' \
    && cd shairport-sync \
    && autoreconf -i -f \
    && ./configure \
        --prefix=/usr/local --with-alsa --with-avahi --with-ssl=mbedtls \
        --with-libdaemon --with-soxr --with-metadata --with-apple-alac --with-convolution \
    && make && make install \
    && cd .. \
#    \
#    && rm -rf alac shairport-sync \
    \
    && apk del --purge \
        build-base git xmltoman autoconf automake libtool libdaemon-dev \
        popt-dev avahi-dev alsa-lib-dev soxr-dev mbedtls-dev libsndfile-dev libconfig-dev \
    \
#    && rm -fr \
#        /tmp/* \
#        /var/{cache,log}/*

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Shairport Sync" \
    io.hass.description="Use AirPlay on your Home Assistant device" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION}
