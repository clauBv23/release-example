#!/usr/bin/env bash

set -euo pipefail

# Define the mapping as an associative array
mapping="contracts:@cla/contracts-monorepo configs:@cla/configs-monorepo"

package="${REF_NAME##*-}"

echo "herererererere=======>"
echo $REF_NAME
echo $package

echo "Looping through keys and values:"

for pair in $mapping; do
    key="${pair%%:*}"
    value="${pair#*:}"

    if [[ "$key" != "$package" ]]; then
        #  this logic would need to change since commons has more than 2 packages
        changeset version --ignore $value
    fi
done

