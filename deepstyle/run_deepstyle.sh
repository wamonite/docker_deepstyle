#!/usr/local/bin/dumb-init /bin/bash

set -e

image_style=/opt/deepstyle/in/${IMAGE_STYLE:-}
image_content=/opt/deepstyle/in/${IMAGE_CONTENT:-}
num_iterations=${NUM_ITERATIONS:-1000}

[[ -z "$image_style" || -z "$image_content" ]] && { echo "IMAGE_STYLE and IMAGE_CONTENT need to be set" 1>&2 ; exit 1 ; }

[[ -f "$image_style" && -f "$image_content" ]] || { echo "IMAGE_STYLE and IMAGE_CONTENT not found" 1>&2 ; exit 1 ; }

. /opt/torch/install/bin/torch-activate
cd /opt/deepstyle/neural-style
th neural_style.lua -style_image "$image_style" -content_image "$image_content" -output_image /opt/deepstyle/out/out.png -gpu -1 -num_iterations ${num_iterations}
tar -czvf /opt/deepstyle/out.tgz -C /opt/deepstyle/ out
