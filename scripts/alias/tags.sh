#!/usr/bin/env bash

set -euo pipefail

version="${GITHUB_REF_NAME#v}"
major="${version%%.*}"
rest="${version#*.}"
minor="${rest%%.*}"

git tag --force "v${major}.${minor}"
git push --force origin "refs/tags/v${major}.${minor}"

if [ "${major}" -ge 1 ]; then
    git tag --force "v${major}"
    git push --force origin "refs/tags/v${major}"
fi
