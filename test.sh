#!/bin/sh
# Runs test environments.
# Usage: ./test.sh {apt|apk|brew}

TEST_SH=$(basename "$0")
IID_FILE=$(mktemp)
if [ -z "$IID_FILE" ]; then
    echo "$TEST_SH: mktemp failed" >&2
    exit 1
fi

echo_and_run() {
    echo "$TEST_SH:" "$@"
    "$@"
}

cleanup () {
    echo_and_run docker image rm -f "$(cat "$IID_FILE")"
    echo_and_run rm -f "$IID_FILE"
}

test() {
    trap exit INT HUP TERM
    trap 'cleanup' EXIT
    echo_and_run docker build . -f "$1.Dockerfile" --iidfile "$IID_FILE"
    echo_and_run docker run --rm -it "$(cat "$IID_FILE")"
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
