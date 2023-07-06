# shellcheck disable=SC1000-SC9999

if ! has dotnet; then
    echo "dotnet is not installed" >&2
    return 1
fi

# https://docs.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#zsh

# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
