#/bin/bash

# ensure running as root
if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@"
fi

apt-get update -qq && apt-get install -qqy wget unzip
wget https://ttnreleases.blob.core.windows.net/release/v1-staging/ttnctl-linux-amd64.zip -O ttnctl.zip
unzip ttnctl.zip
mv -f ttnctl-linux-amd64 ttnctl
chmod +x ttnctl
mv -f ttnctl /usr/bin/
echo "debug: true" > ~/.ttnctl.yaml
echo "mqtt-broker: 10.25.2.62:1883" >> ~/.ttnctl.yaml
echo "ttn-account-server: https://account.thethingsnetwork.org" >> ~/.ttnctl.yaml
echo "ttn-handler: 10.25.2.62:1782" >> ~/.ttnctl.yaml
echo "ttn-router: 10.25.2.62:1700" >> ~/.ttnctl.yaml
rm -f ttnctl.zip
