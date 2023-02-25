#!/usr/bin/env bash

wordpressDbAnon() {
  local IDS=$(wex-exec site/exec -l -c="wp user list --allow-root --field=id")
  for ID in ${IDS[@]}; do
    # Set all IDs to password.
    wex-exec site/exec -l -c="wp user update "$(wex-exec string/trim -s=${ID})" --user_pass=password --allow-root --skip-email"
  done
}
