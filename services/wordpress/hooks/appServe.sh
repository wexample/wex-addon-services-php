#!/usr/bin/env bash

wordpressAppServe() {
  wex app::app/exec -vv -c="service apache2 restart"
}