#!/usr/bin/env sh

# Default Script Vars
readonly SCRIPT_VERSION=0.0.0
readonly SCRIPT_PATH=$(realpath "$0")
readonly SCRIPT_NAME=${SCRIPT_PATH##*/}
readonly SCRIPT_DIR=${SCRIPT_PATH%/*}

if [ -e "$SCRIPT_DIR/functions.sh" ]; then
    . "$SCRIPT_DIR/functions.sh"
else
    echo "Could not find functions.sh"
    echo "Exiting with status 1"
    exit 1
fi

# Parse Options
while [ $# -gt 0 ]
do
    case "$1" in
        -v|--version)
            echo "$SCRIPT_NAME - $SCRIPT_VERSION"
            exit 0
        ;;
        -h|--help)
            display_usage
            exit 0
        ;;
    esac
done

exit 0
