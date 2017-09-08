#!/bin/bash

mysql -h $1 -u $2 --password=$3 --i-am-a-dummy -A $4 -e "$5"
