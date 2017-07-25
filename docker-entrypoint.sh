#!/bin/bash
#
#
#

IPADDRESS="$(ip address | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d''/)"

mkdir /root/.ssh

echo ${SSH_KEY} /root/.ssh/authorized_keys

cd /opt/cobaltstrike
/opt/cobaltstrike/key.sh ${COBALTSTRIKE_KEY}
wait 5
/opt/cobaltstrike/cloudfront.sh ${CLOUDFRONT_URL}
/opt/cobaltstrike/teamserver $IPADDRESS ${COBALTSTRIKE_PASS} /opt/cobaltstrike/profiles/${COBALTSTRIKE_PROFILE}.profile ${COBALTSTRIKE_EXP}