#!/usr/bin/env sh

# Grep the config file for [key=] and return 0 if exists.
# Usage: _conf_exists [key]
_conf_exists() {

    if [ ! $1 ]; then
        return 1
    fi

    res=$(cat "$SCRIPT_DIR/.conf" | grep $(printf "%s" "$1="))

    if [ ${#res} -gt 0 ]; then
        return 0
    else
        return 1
    fi
}

# Replace or append conf value depending on conf exists.
# Usage: _store_conf [key] [val]
_store_conf() {

    if _conf_exists "$1"; then
        $(sed -i $(printf "%s" "s/$1=\".*\"/$1=\"$2\"/g") "$SCRIPT_DIR/.conf")
    else
        $(printf "%s\n" "$1=\"$2\"" | tee -a "$SCRIPT_DIR/.conf" > /dev/null)
    fi

    return 0
}
