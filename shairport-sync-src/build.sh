apk add avahi mbedtls
apk add build-base git xmltoman autoconf automake libtool libdaemon-dev popt-dev avahi-dev alsa-lib-dev soxr-dev mbedtls-dev libsndfile-dev libconfig-dev

cd ~

git clone 'https://github.com/mikebrady/alac.git'
cd alac
autoreconf -i -f
./configure --prefix=/usr/local
make
make install
ldconfig
cd ..

git clone 'https://github.com/mikebrady/shairport-sync.git'
cd shairport-sync
autoreconf -i -f
./configure --prefix=/usr/local --with-alsa --with-avahi --with-ssl=mbedtls --with-libdaemon --with-soxr --with-metadata --with-apple-alac --with-convolution
make
make install
cd ..

rm -rf alac shairport-sync

apk del --purge build-base git xmltoman autoconf automake libtool libdaemon-dev popt-dev avahi-dev alsa-lib-dev soxr-dev mbedtls-dev libsndfile-dev libconfig-dev

rm -rf /var/cache/*
