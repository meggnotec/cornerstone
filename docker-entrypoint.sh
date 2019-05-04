#!/bin/bash
set -e

if [ "$1" == "bash" ]; then
	bash
elif [ "$1" == "start" ]; then

	if [ ! -e "/bcstencil/efurniture/node_modules" ]; then
		npm install --loglevel=error
	fi

	if [ ! -e "/bcstencil/efurniture/.stencil" ]; then
		if [ -e "/etc/stencil/.stencil" ]; then
			cp /etc/stencil/.stencil /bcstencil/efurniture/
		else
			stencil init
		fi
	fi

	stencil start
else
	exec "$@"
fi
