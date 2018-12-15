#!/usr/bin/env bash

if [ -z ${CIRCLE_TOKEN} ] ; then
    echo "You need to configure CIRCLE_TOKEN variable (export CIRCLE_TOKEN=THE_TOKEN_VALUE)"
    exit 1

elif [ -z ${COMMIT_HASH} ] ; then
    echo "You need to configure COMMIT_HASH variable (export COMMIT_HASH=THE_COMMIT_HASH)"
    exit 1
fi  

curl --user ${CIRCLE_TOKEN}: \
    --request POST \
    --form revision=${COMMIT_HASH}\
    --form config=@config.yml \
    --form notify=false \
        https://circleci.com/api/v1.1/project/github/${CIRCLE_CI_USER:-medmrgh}/${CIRCLE_CI_PROJECT:-docker-locust}/tree/${BRANCH_NAME:-master}
