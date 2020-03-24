#!/bin/sh
set -x

echo "::set-output name=value::$(docker inspect "${INPUT_IMAGE}" | jq -r ".[0].Config.Labels[\"${INPUT_LABEL}\"]")"
