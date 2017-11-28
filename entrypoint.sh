#!/bin/bash

set +e

if [ -z "${URL}" ]; then
  echo >&2 "[IMAGENARIUM]: You need to specify URL"
  exit 1
fi

while true; do
  echo "[IMAGENARIUM]: Checking HTTP status for URL: ${URL}"

  status=$( curl -sIX GET "${URL}" | grep HTTP |  awk '{print $2}' )

  if [ "$status" == "200" ]; then
    echo "[IMAGENARIUM]: Success"
    break
  else
    if [ "$status" == "" ]; then
      echo "[IMAGENARIUM]: Failed. Can't retrieve HTTP status"
    else
      echo "[IMAGENARIUM]: Failed. HTTP status: $status"
    fi
  fi

  sleep 1
done