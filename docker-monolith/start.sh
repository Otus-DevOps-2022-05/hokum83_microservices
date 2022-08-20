#!/bin/bash

/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongod.conf

source /reddit/db_config

cd /reddit && puma || exit
