#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://dev-api.stackbit.com/project/5df38c01cb78fe001a4db48c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://dev-api.stackbit.com/pull/5df38c01cb78fe001a4db48c
curl -s -X POST https://dev-api.stackbit.com/project/5df38c01cb78fe001a4db48c/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://dev-api.stackbit.com/project/5df38c01cb78fe001a4db48c/webhook/build/publish > /dev/null
