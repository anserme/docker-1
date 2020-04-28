#!/usr/bin/env bash
if [ ! -z "${port}" ]
    then
          sed -i "s/bayeport/${port}/g"  "/etc/v2ray/config.json"
fi
if [ ! -z "${listen}" ]
    then
         sed -i "s/\"bayelisten\"/\"${listen}\"/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${uuid}" ]
    then
         sed -i "s/\"bayeid\"/\"${uuid}\"/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${alterid}" ]
    then
         sed -i "s/bayealter/${alterid}/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${net}" ]
    then
         sed -i "s/\"bayenet\"/\"${net}\"/g" "/etc/v2ray/config.json"
fi
if [ ! -z "${path}" ]
    then
         sed -i "s/\"bayepath\"/\"${path}\"/g" "/etc/v2ray/config.json"
fi


v2ray -config=/etc/v2ray/config.json
