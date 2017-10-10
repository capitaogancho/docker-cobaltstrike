#!/bin/bash
#
#
#

IPADDRESS="$(ip address | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d''/)"

mkdir /root/.ssh

echo ${SSH_KEY} > /root/.ssh/authorized_keys
service ssh start

cd /opt/cobaltstrike
token=`curl -s https://www.cobaltstrike.com/download -d "dlkey=${COBALTSTRIKE_KEY}" | grep 'href="/downloads/' | cut -d '/' -f3`
curl -s https://www.cobaltstrike.com/downloads/${token}/cobaltstrike-trial.tgz -o /tmp/cobaltstrike.tgz
tar zxf /tmp/cobaltstrike.tgz -C /opt
/opt/cobaltstrike/key.sh ${COBALTSTRIKE_KEY}
wait 5
/opt/cobaltstrike/cloudfront.sh ${CLOUDFRONT_URL}
/opt/cobaltstrike/teamserver $IPADDRESS ${COBALTSTRIKE_PASS} /opt/cobaltstrike/profiles/${COBALTSTRIKE_PROFILE}.profile ${COBALTSTRIKE_EXP}