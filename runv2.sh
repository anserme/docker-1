#!/usr/bin/env bash
if [ ! -z "${bayeport}" ]
    then
          sed -i "s/bayeport/${port}/g"  "/etc/v2ray/config.json"
fi
if [ ! -z "${bayelisten}" ]
    then
         sed -i "s/\"bayelisten\"/\"${user}\"/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${bayeid}" ]
    then
         sed -i "s/\"bayeid\"/\"${key}\"/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${bayealter}" ]
    then
         sed -i "s/bayealter/${alter}/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${bayenet}" ]
    then
         sed -i "s/\"bayenet\"/\"${net}\"|g" "/etc/v2ray/config.json"
fi
if [ ! -z "${bayepath}" ]
    then
         sed -i "s/\"bayepath\"/\"${path}\"|g" "/etc/v2ray/config.json"
fi

acme.sh --install-cert -d ${domain} --ecc \
        --key-file       /etc/v2ray/v2ray.key \
        --fullchain-file /etc/v2ray/v2ray.crt \
        --reloadcmd     "service nginx force-reload"



v2ray -config=/etc/v2ray/config.json
