docker run \
-d \
--name plex \
--network=physical \
--ip=<IPAddress> \
-e TZ="<timezone>" \
-e PLEX_CLAIM="<claimToken>" \
-h <HOSTNAME> \
-v <path/to/plex/database>:/config \
-v <path/to/transcode/temp>:/transcode \
-v <path/to/media>:/data \
plexinc/pms-docker

