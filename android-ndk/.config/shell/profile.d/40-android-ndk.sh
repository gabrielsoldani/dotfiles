# shellcheck shell=sh

if [ -n "$HOMEBREW_PREFIX" ] \
    && [ -d "$HOMEBREW_PREFIX/share/android-ndk" ]; then
    ANDROID_NDK_HOME="$HOMEBREW_PREFIX/share/android-ndk"
    export ANDROID_NDK_HOME
else
    echo "android-ndk is not installed" >&2
    return 1
fi
