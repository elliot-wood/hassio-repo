#!/usr/bin/with-contenv bashio
# ==============================================================================
# Sets up the configuration file for Shairport-Sync
# ==============================================================================
declare airplay_name
declare avahi_hostname

if ! bashio::config.has_value 'avahi_hostname'; then
    bashio::log.fatal
    bashio::log.fatal "Add-on configuration is incomplete!"
    bashio::log.fatal "Set the hostname to the mDNS name of the server."
    bashio::log.fatal "Please set the 'avahi_hostname' add-on option."
    bashio::log.fatal
    bashio::exit.nok
fi

#if bashio::config.has_value 'username'; then
#    bashio::config.require.password
#    username=$(bashio::config 'username')
#    password=$(bashio::config 'password')
#    {
#        echo "username =${username}"
#        echo "password =${password}"
#    } >> /etc/spotifyd.conf
#fi

name=$(bashio::config 'airplay_name')
{
	echo "general ="
	echo "\{"
    echo "name = ${airplay_name}"
    echo "\}\;"
} > /etc/shairport-sync.conf

avahi_hostname=$(bashio::config 'avahi_hostname')
{
	echo "[server]"
	echo "host-name=${avahi_hostname}"
	echo "allow-interfaces=eth0"
} > /etc/avahi/avahi-daemon.conf