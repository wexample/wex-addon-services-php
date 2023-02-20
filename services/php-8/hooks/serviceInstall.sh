#!/usr/bin/env bash

php8ServiceInstall() {
  if [ "$(wex-exec app::service/user -s=mysql)" = "true" ];then
    _wexLog "Adding mysql environment variables to php docker compose"
    cat "${SERVICE_DIR}docker/docker-compose.mysql.part.yml" >> "${WEX_DIR_APP_DATA}docker/docker-compose.yml"
  fi
}