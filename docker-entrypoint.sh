#!/usr/bin/env bash

isCliTool() {
  for cmd in \
  "artisan" \
  "bin/console" \
  "bin/cake" \
  "yii" \
  "zf" \
  "wp"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed in looks like an option flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /tini -- php "$@"

# check if the first argument passed in looks like an args... flag
elif [ "$(printf %c "$1")" = '--' ]; then
  set -- /tini -- php "$@"

# check if the first argument passed in is php
elif [ "$1" = 'php' ]; then
  set -- /tini -- "$@"

# check if the first argument passed in matches a known framework cli tool
elif isCliTool "$1"; then
  set -- /tini -- php "$@"
fi

exec "$@"
