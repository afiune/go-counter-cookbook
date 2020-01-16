#!/bin/bash

set -eou pipefail

# temp pem key path
key_path=/tmp/key.pem

function cleanup() {
  rm -rf "$key_path" berks-cookbooks
}

vault kv get -field afiune_private_key secret/chef-workstation/hosted-org > $key_path
trap cleanup EXIT

berks vendor

knife cookbook upload go-counter-cookbook \
 --user afiune \
 --key "$key_path" \
 --server-url https://api.chef.io/organizations/afiune \
 --cookbook-path berks-cookbooks
