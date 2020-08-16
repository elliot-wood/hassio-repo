#!/bin/sh

# install runtime deps
apk add dbus avahi mbedtls libconfig alsa-lib popt libsndfile soxr

# install build deps
apk add build-base git xmltoman autoconf automake libtool libdaemon-dev popt-dev avahi-dev alsa-lib-dev soxr-dev mbedtls-dev libsndfile-dev libconfig-dev

cd ~

# compile and install Apple ALAC library
git clone 'https://github.com/mikebrady/alac.git'
cd alac
autoreconf -i -f
./configure --prefix=/usr/local
make
make install
ldconfig
cd ..

# compile and install shairport-sync
git clone 'https://github.com/mikebrady/shairport-sync.git'
cd shairport-sync
autoreconf -i -f
./configure --prefix=/usr/local --with-alsa --with-avahi --with-ssl=mbedtls --with-libdaemon --with-soxr --with-metadata --with-apple-alac --with-convolution
make
make install
cd ..

# remove build dependencies
apk del --purge build-base git xmltoman autoconf automake libtool libdaemon-dev popt-dev avahi-dev alsa-lib-dev soxr-dev mbedtls-dev libsndfile-dev libconfig-dev

# clean up the image
rm -rf alac shairport-sync
rm -rf /var/cache/{log,apk}/*
