#!/bin/bash

docker run -it --rm \
	-v "$(pwd)":/mnt/data \
	--network none \
	focus-stack $UID "$@"
