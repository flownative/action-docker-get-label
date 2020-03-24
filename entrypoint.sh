#!/bin/sh
set -x

if [ "${INPUT_REGISTRY_PASSWORD}" != "" ]; then
    echo "${INPUT_REGISTRY_PASSWORD}" | docker login -u "${INPUT_REGISTRY_USERNAME}" --password-stdin "${INPUT_REGISTRY_ENDPOINT}"
fi

docker pull "${INPUT_IMAGE}"
echo "::set-output name=value::$(docker inspect "${INPUT_IMAGE}" | jq -r ".[0].Config.Labels[\"${INPUT_LABEL}\"]")"
