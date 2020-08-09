ARG BUILD_FROM=hassioaddons/ubuntu-base:5.2.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN \
    apt-get update \
    \
    && apt-get install -y --no-install-recommends \
		shairport-sync \
    \
    && rm -fr \
        /tmp/* \
        /var/{cache,log}/* \
        /var/lib/apt/lists/*

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
#LABEL \
#    io.hass.name="Spotify Connect" \
#    io.hass.description="Play Spotify music on your Home Assistant device" \
#    io.hass.arch="${BUILD_ARCH}" \
#    io.hass.type="addon" \
#    io.hass.version=${BUILD_VERSION} \
#    maintainer="Franck Nijhof <frenck@addons.community>" \
#    org.opencontainers.image.title="Spotify Connect" \
#    org.opencontainers.image.description="Play Spotify music on your Home Assistant device" \
#    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
#    org.opencontainers.image.authors="Franck Nijhof <frenck@addons.community>" \
#    org.opencontainers.image.licenses="MIT" \
#    org.opencontainers.image.url="https://addons.community" \
#    org.opencontainers.image.source="https://github.com/hassio-addons/addon-spotify-connect" \
#    org.opencontainers.image.documentation="https://github.com/hassio-addons/addon-spotify-connect/blob/master/README.md" \
#    org.opencontainers.image.created=${BUILD_DATE} \
#    org.opencontainers.image.revision=${BUILD_REF} \
#    org.opencontainers.image.version=${BUILD_VERSION}
