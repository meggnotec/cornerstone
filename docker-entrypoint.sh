#!/bin/bash
set -e

if [ "$1" == "bash" ]; then
	bash
elif [ "$1" == "start" ]; then

	if [ ! -e "/bcstencil/efurn/node_modules" ]; then
		npm install --loglevel=error
	fi

	if [ ! -e "/bcstencil/efurn/.stencil" ]; then
		if [ -e "/etc/stencil/.stencil" ]; then
			cp /etc/stencil/.stencil /bcstencil/efurn/
		else
			stencil init
		fi
	fi

	stencil start
else
	exec "$@"
fi
