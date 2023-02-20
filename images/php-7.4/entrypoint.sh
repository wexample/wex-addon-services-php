#!/usr/bin/env bash

service apache2 start
service php8.2-fpm start

# Load parent entry point.
. /docker-entrypoint-ubuntu.sh
