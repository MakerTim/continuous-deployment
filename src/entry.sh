#!/usr/bin/env sh

set -euo pipefail

main() {
  echo "[$(date +'%H:%M:%S')] entry "'"'"${*}"'"'"" >&2
  ls -ls

  i=0
  set -x
  while [[ "$i" -lt $LOOP_COUNT ]]; do
    {
      if [[ -z ${SKIP_GIT} ]]; then
        [[ $(git pull) == 'Already up to date.' ]] || sleep "${INTERVAL:?}" && continue
      fi
      # shellcheck disable=SC2093
      sh "$@"
      docker compose down
      docker compose up -d
    } || true

    i=$((i+1))
    if [[ "$i" -lt $LOOP_COUNT ]]; then
      sleep "${INTERVAL:?}"
    fi
  done
}


main "$@"
