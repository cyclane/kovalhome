#!/bin/bash

docker stop nextcloud-aio-mastercontainer || true
docker rm nextcloud-aio-mastercontainer || true

docker run \
--init \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart unless-stopped \
--publish 8080:8080 \
--env NEXTCLOUD_UPLOAD_LIMIT=16G \
--env NEXTCLOUD_MAX_TIME=7200 \
--env NEXTCLOUD_ADDITIONAL_APKS="imagemagick ffmpeg" \
--env APACHE_PORT=11000 \
--env APACHE_IP_BINDING=0.0.0.0 \
--env TZ=Europe/London \
--env AIO_DISABLE_BACKUP_SECTION=true \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
-d nextcloud/all-in-one:latest
