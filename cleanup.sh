#!/bin/bash -e
sudo docker-compose down
sudo rm -rf development/db
sudo rm development/log/mysql/*
sudo rm development/log/nginx/*
