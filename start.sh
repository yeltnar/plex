# docker rmi -f plex
docker rm -f plex

if [ -z "$1" ]
then
    media_location='/media/drew/Expansion Drive/Movies';
else
    media_location=$1;
fi

echo media_location is \"$media_location\"

docker run \
--restart unless-stopped \
-d \
--name plex \
--network=host \
-e TZ="America/Chicago" \
-e PLEX_CLAIM="$(cat claim.txt)" \
-v "$(pwd)/db":/config \
-v "$(pwd)/transcode_temp":/transcode \
-v "$media_location":/data \
plexinc/pms-docker

