#!/usr/bin/env bash

set -e

echo 'Unifi pin connector: v'$(cat VERSION) > index.html

echo '<<< run http'
exec apache2-foreground
