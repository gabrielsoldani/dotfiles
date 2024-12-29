# shellcheck shell=sh

# Disable telemetry.
# https://docs.microsoft.com/en-us/dotnet/core/tools/telemetry#how-to-opt-out
# NOTE: We explicitly don't want to check if `dotnet` is installed before
# setting the following environment variable because we want to disable
# installer telemetry as well.
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [ -n "$HOMEBREW_PREFIX" ] \
    && [ -e "$HOMEBREW_PREFIX/opt/dotnet/libexec" ]; then
    export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"
fi
