#!/usr/bin/env sh
# -*- coding: utf-8 -*-

x() {
	for arg in "$@"; do
		(xdg-open "${1}" >/dev/null 2>&1 &)
	done
}
