#!/usr/bin/env bash

php8AppStarted() {
  # Wait mounted volumes to be available
  _wexLog "Waiting for apache to restart..."
  sleep 5

  wex app::app/serve
}