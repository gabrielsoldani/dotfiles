# shellcheck shell=sh

# make, but using my cool custom rules.
m() {
    make -f "${XDG_CONFIG_HOME:-$HOME/.config}"/make/makefile "$@"
}

# make, but continuously watching for outdated targets.
alias mw='_makew_common m'
alias makew='_makew_common make'

_makew_common () {
    cmd="$1"
    always=false
    shift

    echo "${cmd}w: Watching..."

    while true; do
        $cmd -q "$@"
        exit_status=$?

        if [ "$exit_status" -eq 1 ]; then
            echo "${cmd}w: Target was not up-to-date."
            $cmd "$@"
            exit_status=$?
        fi

        if [ "$exit_status" -ne 0 ] && [ "$always" != "true" ]; then
            printf "%sw: An error occurred. Continue? [Y/n/a] " "$cmd"
            read -r answer
            case "$answer" in
                [Nn]*) break ;;
                [Aa]*) always=true ;;
                *)     ;;
            esac
        else
            sleep 1
        fi
    done

    return "$exit_status"
}
