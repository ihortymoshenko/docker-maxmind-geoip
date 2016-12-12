## maxmind-geoip Dockerfile


This repository contains **Dockerfile** of [maxmind-geoip](http://dev.maxmind.com/geoip/geoipupdate/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/igortimoshenko/docker-maxmind-geoip/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/igortimoshenko/docker-maxmind-geoip/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull igortimoshenko/docker-maxmind-geoip`

   (alternatively, you can build an image from Dockerfile: `docker build -t="igortimoshenko/docker-maxmind-geoip" github.com/igortimoshenko/docker-maxmind-geoip`)


### Usage

    docker run -d \
    igortimoshenko/docker-maxmind-geoip
    

Available environment variables:


| Environment variable | Default value | Description |
| -------------------- | ------------- | ----------- |
| CRONTAB_MAILTO | root | The cron mailto |
| CRONTAB_FREQUENCY | 0 0 * * 1 | The cron frequency to run `geoipupdate` |
| USER_ID | 999999 | The Maxmind GeoIP user ID |
| LICENSE_KEY | 000000000000 | The Maxmind GeoIP license key |
| PRODUCT_IDS | GeoLite2-City GeoLite2-Country GeoLite-Legacy-IPv6-City GeoLite-Legacy-IPv6-Country 506 517 533 | The list of Maxmind GeoIP's product IDs to update separated by space |

The Dockerfile provides the `/usr/share/GeoIP` volume so you can use it as a data container.
