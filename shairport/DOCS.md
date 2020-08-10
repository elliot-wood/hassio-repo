# Shairport Sync

## Configuration options

### `airplay_name`
This sets the name presented to AirPlay clients.

### `avahi_hostname`
This should be set to the host system's hostname. Otherwise,
Avahi may fail to advertise the ShairPort server.

### `avahi_domain`
Avahi domain. Should almost always be set to "local".

### `ap_password` (optional)
Require a password to stream to the AirPlay server.

### `ap_interpolation` (optional)
Which style of interpolation to use. Default is "basic", enable "soxr" only
if you have a reasonably fast processor.

### `ap_port` (optional)
TCP port for the AirPlay server to listen on.

### `ap_drift` (optional)
Set how far (in frames) drift from exact sync is allowed before attemping
to correct the sync.

### `ap_resync` (optional)
Hard limit for sync error. Setting to '0' disables this feature.

### `ap_ignore_volume` (optional)
Ignore the AirPlay client's volume controls, always play at 100% volume.

### `ap_playback_mode` (optional)
This can be "stereo" or "mono", default is "stereo".
