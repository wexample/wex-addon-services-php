#!/usr/bin/env bash

wordpressAppServe() {
  wex-exec app::app/exec -vv -c="service apache2 restart"
}