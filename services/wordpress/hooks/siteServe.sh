#!/usr/bin/env bash

wordpressSiteServe() {
   # Might be the default way to serve instead of restart.
   wex site/exec -c="service apache2 reload"
}