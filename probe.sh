#!/bin/bash

if [ -z "$MONGO_net_tls_mode" ]; then
  mongo $(hostname -f):27017 --eval "db.adminCommand('ping')"  | grep "\"ok\" : 1"  
else
   mongo --tls --tlsCertificateKeyFile $(eval echo ${MONGO_net_tls_certificateKeyFile}) --tlsCAFile ${MONGO_net_tls_CAFile} --host $(hostname -f) --eval "db.adminCommand('ping')" | grep "\"ok\" : 1"   
fi

