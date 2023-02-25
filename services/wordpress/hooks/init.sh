#!/usr/bin/env bash

wordpressInit() {
  # Wordpress version
  cat <<EOF >>.wex

# Wordpress 5
WP_DB_CHARSET=utf8                          # Database charset
WP_DB_TABLE_PREFIX=wp_                      # Used for wordpress database
WP_DEBUG_ENABLED=false                      # Will allow wordpress debug mode
WP_VERSION=5.6.1-php7.4-apache              # Docker image tags
EOF
}
