#!/bin/bash
sudo multitail -s 2 -sn 1,2 -cS mysql development/log/mysql/error.log \
    -cS apache development/log/nginx/access.log \
    -cS apache_error development/log/nginx/error.log \
