#!/bin/bash
set -e

USER_ID=${USER_ID:-'999999'}
LICENSE_KEY=${LICENSE_KEY:-'000000000000'}
PRODUCT_IDS=${PRODUCT_IDS:-'GeoLite2-City GeoLite2-Country GeoLite-Legacy-IPv6-City GeoLite-Legacy-IPv6-Country 506 517 533'}

cat > /etc/GeoIP.conf <<EOL
# The following UserId and LicenseKey are required placeholders:
UserId $USER_ID
LicenseKey $LICENSE_KEY

# Include one or more of the following ProductIds:
# * GeoLite2-City - GeoLite 2 City
# * GeoLite2-Country - GeoLite2 Country
# * GeoLite-Legacy-IPv6-City - GeoLite Legacy IPv6 City
# * GeoLite-Legacy-IPv6-Country - GeoLite Legacy IPv6 Country
# * 506 - GeoLite Legacy Country
# * 517 - GeoLite Legacy ASN
# * 533 - GeoLite Legacy City
ProductIds $PRODUCT_IDS
EOL

geoipupdate -v

if [ "$1" = 'cron' ]; then
    CRONTAB_MAILTO=${CRONTAB_MAILTO:-$(whoami)}
    CRONTAB_FREQUENCY=${CRONTAB_FREQUENCY:-'0 0 * * 1'}

    cat > ~/crontab <<EOL
# top of crontab
MAILTO=$CRONTAB_MAILTO

$CRONTAB_FREQUENCY /usr/local/bin/geoipupdate > /home/$(whoami)/geoipupdate.log 2>&1
# end of crontab
EOL

    crontab ~/crontab
    cron -f
fi

exec "$@"
