#!/usr/bin/with-contenv bashio
# ==============================================================================
# Sets up the configuration files for Shairport-Sync
# ==============================================================================
declare airplay_name
declare avahi_hostname
declare avahi_domain
declare ap_password
declare ap_interpolation
declare ap_port
declare ap_drift
declare ap_resync
declare ap_ignore_volume
declare ap_statistics
declare ap_playback_mode
declare log_level


if ! bashio::config.has_value 'avahi_hostname'; then
    bashio::log.fatal
    bashio::log.fatal "Add-on configuration is incomplete!"
    bashio::log.fatal "Set the hostname to the mDNS name of the server."
    bashio::log.fatal "Please set the 'avahi_hostname' add-on option."
    bashio::log.fatal
    bashio::exit.nok
fi


# /usr/local/etc/shairport-sync.con
# TODO: make this not incredibly cursed
{
	echo "general ="
	echo "{"
} > /usr/local/etc/shairport-sync.con

if bashio::config.has_value 'airplay_name'; then
	airplay_name=$(bashio::config 'airplay_name')
	{
		echo "name = \"${airplay_name}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_password'; then
	ap_password=$(bashio::config 'ap_password')
	{
		echo "password = \"${ap_password}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_interpolation'; then
	ap_interpolation=$(bashio::config 'ap_interpolation')
	{
		echo "interpolation = \"${ap_interpolation}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_port'; then
	ap_port=$(bashio::config 'ap_port')
	{
		echo "port = \"${ap_port}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_drift'; then
	ap_drift=$(bashio::config 'ap_drift')
	{
		echo "drift = \"${ap_drift}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_resync'; then
	ap_resync=$(bashio::config 'ap_resync')
	{
		echo "resync_threshold = \"${ap_resync}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_ignore_volume'; then
	ap_ignore_volume=$(bashio::config 'ap_ignore_volume')
	{
		echo "ignore_volume_control = \"${ap_ignore_volume}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_statistics'; then
	ap_statistics=$(bashio::config 'ap_statistics')
	{
		echo "statistics = \"${ap_statistics}\""
	} >> /usr/local/etc/shairport-sync.con
fi

if bashio::config.has_value 'ap_playback_mode'; then
	ap_playback_mode=$(bashio::config 'airplay_name')
	{
		echo "playback_mode = \"${ap_playback_mode}\""
	} >> /usr/local/etc/shairport-sync.con
fi

{
    echo "};"
} >> /usr/local/etc/shairport-sync.con


# /etc/avahi/avahi-daemon.conf
avahi_hostname=$(bashio::config 'avahi_hostname')
avahi_domain=$(bashio::config 'avahi_domain')
{
	echo "[server]"
	echo "host-name=${avahi_hostname}"
	echo "domain-name=${avahi_domain}"
	echo "allow-interfaces=eth0"
} > /etc/avahi/avahi-daemon.conf
