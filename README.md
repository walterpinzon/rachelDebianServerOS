rachelpiOS
---------------



Prerequisites
---------------
Debian Jessie Server

Phyton
Phyton
Sudo



Install
---------------

To install is easy:

Expand your microSD card partition
`sudo raspi-config`
`sudo reboot`

NOTE: for WIFI to ever work on the unit, you must have the WIFI USB dongle inserted
during installation so that the install script can configure it properly.

paste in the following command after reboot.

`curl -fsS https://raw.githubusercontent.com/rachelproject/rachelpiOS/master/installer.py | python`

Please note that this will change the 'pi' user's password to: rachel

All default username and passwords will be rachel/rachel unless noted differently.

Additional Details
---------------
Please check out the Wiki: https://github.com/rachelproject/rachelpiOS/wiki
