#!/usr/bin/env bash

laravel5AppBuild() {
  . .env

  ENV_NAME="production"
  if [ "${APP_ENV}" != "prod" ];then
    ENV_NAME="dev"
  fi;

  # Assets.
  wex-exec site/exec -l -c="npm run ${ENV_NAME}"
}