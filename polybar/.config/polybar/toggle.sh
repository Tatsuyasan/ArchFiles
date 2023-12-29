#!/usr/bin/env bash

if killall polybar then
	polybar main -c $(dirname $0)/config.ini &
fi
