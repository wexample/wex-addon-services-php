#!/usr/bin/env bash

php8AppServe() {
  wex app/exec -c="service apache2 restart"
}