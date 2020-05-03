# docker rmi -f plex
docker rm -f plex
docker pull plexinc/pms-docker

if [ -z "$1" ]
then
    media_location='/media/drew/Expansion Drive/Movies';
else
    media_location=$1;
fi

echo media_location is \"$media_location\"

docker run \
-d \
--name plex \
--network=host \
-e TZ="America/Chicago" \
-e PLEX_CLAIM="$(cat claim.txt)" \
-v "$(pwd)/db":/config \
-v "$(pwd)/transcode_temp":/transcode \
-v "$media_location":/data \
--rm \
plexinc/pms-docker

