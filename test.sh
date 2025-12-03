#!/bin/sh
timeout 60 ./bin/a
status=$?
[ $status -eq 0 ] || exit 1
