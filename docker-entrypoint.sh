#!/usr/bin/env bash

isCommand() {
  for cmd in "artisan"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /tini -- php "$@"
# check if the first argument passed in is php
elif [ "$1" = 'php' ]; then
  set -- /tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /tini -- php "$@"
fi

exec "$@"
