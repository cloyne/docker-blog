#!/bin/bash
multitail -s 2 -sn 2,1 -cS apache_error development/log/nginx/error.log \
    -cS mysql development/log/mysql/error.log \
    -cS apache development/log/nginx/access.log
