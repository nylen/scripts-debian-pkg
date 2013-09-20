#!/bin/sh

cd "$(dirname $0)/../system"

case $npm_lifecycle_event in
    postinstall)
        # Copy all files in the 'system' directory to the corresponding
        # location on the root filesystem.
        find . -type f | while read i; do
            mkdir -vp "/$(dirname "$i")"
            cp -va "$i" "/$(dirname "$i")"
        done
        ;;
    uninstall)
        # Remove all files copied from the 'system' directory to the
        # corresponding location on the root filesystem, then remove
        # directories that are empty as a result.
        find . -type f | while read i; do
            rm -v "/$i"
        done
        find . -type d | while read i; do
            [ "$i" != "." ] && rmdir -p --ignore-fail-on-non-empty "/$i"
        done
        ;;
esac
