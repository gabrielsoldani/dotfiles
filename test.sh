#!/bin/sh
# Runs test environments.
# Usage: test.sh {apt|apk|brew}

echo_and_run() {
    echo "$@"
    "$@"
}

cleanup () {
    echo_and_run docker image rm -f "$(cat test.iid)"
    echo_and_run rm -f test.iid
}

test() {
    trap exit INT HUP TERM
    trap 'cleanup' EXIT
    echo_and_run docker build . -f "$1.Dockerfile" --iidfile test.iid
    echo_and_run docker run --rm -it "$(cat test.iid)"
}

case "$1" in
    apt|apk|brew)
        test "$1"
        ;;
    *)
        echo "Usage: $0 {apt|apk|brew}" >&2
        exit 1
        ;;
esac
