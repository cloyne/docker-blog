#!/bin/bash
multitail -cS apache_error development/log/nginx/error.log \
    -cS mysql development/log/mysql/error.log
    # -cS apache -I development/log/nginx/access.log
