
## Run container from Docker registry
To run the container use this command:

```
$ docker run --privileged  -d \
              -e "LOCAL_NETWORK=192.168.0.0/24" \
              -e "OPENVPN_PROVIDER=PIA" \
              -e "OPENVPN_CONFIG=Netherlands" \
              -e "OPENVPN_USERNAME=user" \
              -e "OPENVPN_PASSWORD=pass" \
              -p 2000:3128 \
              x0r3n/vpntoproxy
```

Now you can connect your application to a proxy `YourServerIP:2000`.

All file you can found at my GitHub [here](https://github.com/x0r3n/easyvpntoproxy)

## OpenVPN configuration
Build based on
* [ubuntu:latest]

It bundles certificates and configurations for the following VPN providers:
* anonine
* btguard - 05/04/2020
* cryptostorm - 05/04/2020
* froot
* frostvpn - 05/04/2020
* hideme - 05/04/2020
* hidemyass - 05/04/2020 
* integrityvpn - 05/04/2020
* ipvanish - 16/05/2020
* ivacy - 05/04/2020
* ivpn - 05/04/2020
* newshosting
* nordvpn - 05/04/2020
* ovpn - 05/04/2020
* pia - 05/04/2020
* privatevpn - 05/04/2020
* purevpn - 05/04/2020
* slickvpn - 05/04/2020
* smartvpn
* tiger - 05/04/2020
* torguard - 05/04/2020
* usenetserver
* vpnht - 05/04/2020
* windscribe
* cactusvpn - 05/04/2020
* VeePN - 06/16/2020
* vpnac - 06/16/2020
* boxpn - 06/16/2020

## Run container from Docker registry
The container is available from the Docker registry and this is the simplest way to get it.
To run the container use this command:

```
$ docker run --privileged  -d \
              -e "LOCAL_NETWORK=192.168.0.0/24" \
              -e "OPENVPN_PROVIDER=PIA" \
              -e "OPENVPN_CONFIG=Netherlands" \
              -e "OPENVPN_USERNAME=user" \
              -e "OPENVPN_PASSWORD=pass" \
              -p 5001:8080 \
              dceschmidt/openvpn-client
```

You must set the environment variables `OPENVPN_PROVIDER`, `OPENVPN_USERNAME` and `OPENVPN_PASSWORD` to provide basic connection details.

The `OPENVPN_CONFIG` is an optional variable. If no config is given, a default config will be selected for the provider you have chosen.
Find available OpenVPN configurations by looking in the openvpn folder of the GitHub repository.

### Required environment options
| Variable | Function | Example |
|----------|----------|-------|
|`OPENVPN_PROVIDER` | Sets the OpenVPN provider to use. | `OPENVPN_PROVIDER=provider`. Example: `PIA`, `BTGUARD`, `TIGER`, `FROOT`, `TORGUARD`, `NORDVPN`, `IPVAINSH` ... |
|`OPENVPN_USERNAME`|Your OpenVPN username |`OPENVPN_USERNAME=asdf`|
|`OPENVPN_PASSWORD`|Your OpenVPN password |`OPENVPN_PASSWORD=asdf`|

### Network configuration options
| Variable | Function | Example |
|----------|----------|-------|
|`OPENVPN_CONFIG` | Sets the OpenVPN endpoint to connect to. | `OPENVPN_CONFIG=UK_Southampton_tcp_server_01`|
|`OPENVPN_OPTS` | Will be passed to OpenVPN on startup | See [OpenVPN doc](https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html) |
|`LOCAL_NETWORK` | Sets the local network that should have access. | `LOCAL_NETWORK=192.168.0.0/24`|


#### Use Google DNS servers
Some have encountered problems with DNS resolving inside the docker container.
If you have this problem use dockers --dns flag to override the resolv.conf of the container.
For example use googles dns servers by adding --dns 8.8.8.8 --dns 8.8.4.4 as parameters to the usual run command .

