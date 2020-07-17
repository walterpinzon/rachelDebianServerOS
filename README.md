rachelDebianServerOS 64bits
---------------

Derived from rachelpiOS.

¡You can install Rachel on a PC with 64-bit architecture!.

Sometimes you have a laptop or PC with your screen and your keyboard damaged. I thought it would be good to use this hardware with Rachel.

I felt very happy to achieve it, because many students will have access to Rachel’s contents. That’s why I want to share how it’s done.


Prerequisites
---------------
Debian Jessie Server

python
curl
sudo
ntp
git

Download Debian Jessie.

`https://www.debian.org/releases/jessie/`

Install Debian 8.11 Jessie 64bit server version whit 

`user: pi`

`password: rachel`

and `hostname: rachel`

Configure Network Interface.
---------------
To look at the list of interface names, type.

`ifconfig -a`

`su`
`nano /etc/network/interfaces`
Add the following lines replacing eth0 with the name of the ethernet interface.
`    auto eth0`
`    iface eth0 inet dhcp`

`/etc/init.d/networking restart`

`verify /etc/apt/source.list`

`apt-get update`

`apt-get upgrade`

`apt-get install python curl sudo git`

Download installer and install.
---------------

Manually download the rachelDebianServerOS master project of https://github.com/walterpinzon/rachelDebianServerOS/ and Upload to server

or type:

`cd /home/pi/`

`git clone https://github.com/walterpinzon/rachelDebianServerOS.git`

`cd rachelDebianServerOS/`

`python install.py`


Reconfigure interfaces, repeating the step above "Configure Network Interface", and them type:

`echo 1 > /proc/sys/net/ipv4/ip_forward`

`iptables-restore < /etc/iptables.ipv4.nat`


Please note that this will change the 'pi' user's password to: rachel

All default username and passwords will be rachel/rachel unless noted differently.

`IMPORTANT: The next comand remover modules folder. Move that before install `
python installer.py

apt upgrade

apt-get install -y python-pip

pip install ka-lite-static


See interfaces

Ifconfig -a

nano /etc/network/interfaces

#example

auto up eth0



Additional Details
---------------
Please check out the Wiki: https://github.com/rachelproject/rachelpiOS/wiki
