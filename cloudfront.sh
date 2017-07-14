#!/bin/bash
#
#
#
URL="$1"
FILE="/opt/cobaltstrike/profiles/cloudfront.profile"

sed -i "s/CHANGEME/$URL/" "$FILE"