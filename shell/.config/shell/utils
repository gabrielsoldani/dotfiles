# shellcheck shell=sh

PATH_try_prepend () {
    # Expand the path to an absolute path.
    if ! set -- "$(realpath -- "$1")"; then
        return 1
    fi

    # Make sure it's a directory.
    if [ ! -d "$1" ]; then
        return 1
    fi

    # FIXME: Trim repeating paths.
    PATH="$1:$PATH"
    return 0
}

PATH_try_append () {
    # Expand the path to an absolute path.
    set -- "$(realpath -- "$1")"

    # Make sure it's a directory.
    if [ ! -d "$1" ]; then
        return 1
    fi

    # FIXME: Trim repeating paths.
    PATH="$PATH:$1"
    return 0
}

has () {
    command -v "$1" >/dev/null 2>&1
}

source_if_exists () {
    [ -r "$1" ] && . "$1"
}

eval_output() {
    eval "$("$@" 2>/dev/null || echo false)"
}
