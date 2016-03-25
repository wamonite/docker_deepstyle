#!/bin/bash -u

image_style=${1:-}
image_content=${2:-}
num_iterations=${3:-1000}

[ -f "$image_style" ] || { echo "'$image_style'not found" 1>&2 ; exit 1 ; }
[ -f "$image_content" ] || { echo "'$image_content' not found" 1>&2 ; exit 1 ; }

container_name="$(basename ${image_style})_$(basename ${image_content})_$$"
trap "{ docker stop ${container_name} ; exit 1 ; }" SIGINT SIGTERM
trap "docker rm -v ${container_name}" EXIT

docker create -e "IMAGE_STYLE=$image_style" -e "IMAGE_CONTENT=$image_content" -e "NUM_ITERATIONS=$num_iterations" --name ${container_name} wamonite/deepstyle
docker cp "$image_style" ${container_name}:/opt/deepstyle/in/$(basename "$image_style")
docker cp "$image_content" ${container_name}:/opt/deepstyle/in/$(basename "$image_content")
docker start ${container_name}
docker logs -f ${container_name}
docker cp ${container_name}:/opt/deepstyle/out.tgz ${container_name}.tgz
