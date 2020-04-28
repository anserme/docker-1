#!/usr/bin/env bash
if [ ! -z "${bayeport}" ]
    then
          sed -i "s/mtport/${port}/g"  "/home/tgproxy/config.py"
fi
if [ ! -z "${bayelisten}" ]
    then
         sed -i "s/\"mtuser\"/\"${user}\"/g" "/home/tgproxy/config.py"
fi
if [ ! -z "${bayeid}" ]
    then
         sed -i "s/\"00000000000000000000000000000001\"/\"${key}\"/g" "/home/tgproxy/config.py"
fi
if [ ! -z "${bayealter}" ]
    then
         sed -i "s/3c09c680b76ee91a4c25ad51f742267d/${tag}/g" "/home/tgproxy/config.py"
fi
if [ ! -z "${bayenet}" ]
    then
         sed -i "s|\"www.google.com\"|\"${domain}\"|g" "/home/tgproxy/config.py"
fi
if [ ! -z "${bayepath}" ]
    then
         sed -i "s|\"www.google.com\"|\"${domain}\"|g" "/home/tgproxy/config.py"
fi
v2ray -config=/etc/v2ray/config.json
