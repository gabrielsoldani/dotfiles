# shellcheck shell=sh

if ! PATH_try_append "$HOME/.dotnet/tools"; then
    echo "dotnet: could not add dotnet tools to PATH" >&2
    return 1
fi
