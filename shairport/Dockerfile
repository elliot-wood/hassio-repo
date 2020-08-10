ARG BUILD_FROM=hassioaddons/ubuntu-base:5.2.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
#RUN \
#    apt-get update \
#    \
#    && apt-get install -y --no-install-recommends shairport-sync \
#    \
#    && rm -fr \
#        /tmp/* \
#        /var/{cache,log}/* \
#        /var/lib/apt/lists/*

RUN \
	/bin/true

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