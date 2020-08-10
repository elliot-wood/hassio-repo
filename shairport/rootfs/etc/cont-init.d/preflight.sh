#!/usr/bin/with-contenv bashio
# ==============================================================================
# Sets up the configuration file for Shairport-Sync
# ==============================================================================
declare airplay_name
declare avahi_hostname
declare avahi_domain
declare enable_ipv6
declare log_level

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

airplay_name=$(bashio::config 'airplay_name')
{
	echo "general ="
	echo "{"
    echo "name = \"${airplay_name}\""
    echo "};"
} > /etc/shairport-sync.conf

avahi_hostname=$(bashio::config 'avahi_hostname')
avahi_domain=$(bashio::config 'avahi_domain')
{
	echo "[server]"
	echo "host-name=${avahi_hostname}"
	echo "domain-name=${avahi_domain}"
	echo "allow-interfaces=eth0"
} > /etc/avahi/avahi-daemon.conf