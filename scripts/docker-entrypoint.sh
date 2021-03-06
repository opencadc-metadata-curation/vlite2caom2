#!/bin/bash

if [[ ! -e ${PWD}/config.yml ]]
then
  cp /config.yml ${PWD}
fi

if [[ ! -e ${PWD}/state.yml ]]; then
  if [[ "${@}" == "vlite_run_state" ]]; then
    yesterday=$(date -d yesterday "+%d-%b-%Y %H:%M")
    echo "bookmarks:
    vlite_timestamp:
      last_record: $yesterday
" > ${PWD}/state.yml
  else
    cp /state.yml ${PWD}
  fi
fi

exec "${@}"
