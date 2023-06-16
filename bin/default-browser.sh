#!/bin/bash
#
if [ "$DEFAULT_BROWSER" == "" ]
then
  DEFAULT_BROWSER=vivaldi
fi

$DEFAULT_BROWSER "$@"
