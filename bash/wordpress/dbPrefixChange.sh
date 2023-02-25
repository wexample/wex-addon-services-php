#!/usr/bin/env bash

wordpressDbPrefixChangeArgs() {
  _DESCRIPTION="Change database prefix"
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    'old_prefix o "Old prefix" false'
    'new_prefix n "New prefix" true'
  )
}

# Remove a prefix, do not execute twice !
wordpressDbPrefixChange() {
  _wexAppGoTo . && . "${WEX_FILEPATH_REL_CONFIG_BUILD}"

  if [ -z "${OLD_PREFIX}" ]; then
    OLD_PREFIX=${WP_DB_TABLE_PREFIX}
  fi

  local TABLES=($(wex-exec db/exec -c="SHOW TABLES"))
  local OLD_PREFIX_LENGTH=${#OLD_PREFIX}
  local COUNT=0

  for TABLE in ${TABLES[@]}; do
    # Double [[]] is required for advanced comparison.
    if [[ "${TABLE}" != Tables_in_* ]]; then
      TABLE="$(echo "${TABLE}" | tr -d '\r\n')"
      wex-exec prompt::prompt/progress -nl -m=${#TABLES[@]} -p=${COUNT} -s="Renaming table ${TABLE}"

      local QUERY="RENAME TABLE ${TABLE} TO ${NEW_PREFIX}${TABLE:${OLD_PREFIX_LENGTH}}"
      wex-exec db/exec -vv -c="${QUERY}"
      ((COUNT++))
    fi
  done

  local IDS=($(wex-exec db/exec -c="SELECT umeta_id FROM ${NEW_PREFIX}usermeta WHERE meta_key LIKE \"${OLD_PREFIX}%\""))
  local NAMES=($(wex-exec db/exec -c="SELECT meta_key FROM ${NEW_PREFIX}usermeta WHERE meta_key LIKE \"${OLD_PREFIX}%\""))
  local COUNT=0

  for NAME in ${NAMES[@]}; do
    NAME="$(echo "${NAME}" | tr -d '\r\n')"
    local QUERY="UPDATE ${NEW_PREFIX}usermeta SET meta_key = \"${NAME:${OLD_PREFIX_LENGTH}}\" WHERE umeta_id = \"${IDS[${COUNT}]}\""
    wex-exec db/exec -vv -c="${QUERY}"
    ((COUNT++))
  done

  _wexLog "Updating configuration files"

  wex-exec app::config/setValue -k=WP_DB_TABLE_PREFIX -v="${NEW_PREFIX}"
  wex-exec app::config/setValue -b -k=WP_DB_TABLE_PREFIX -v="${NEW_PREFIX}"

  wex-exec config/setValue -f=wp-config.php -s="=" -k="\$table_prefix" -v="'${NEW_PREFIX}';"
}
