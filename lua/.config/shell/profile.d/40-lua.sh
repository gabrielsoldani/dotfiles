# shellcheck shell=sh

# NOTE: LuaRocks takes a while to load, so we don't want to do it more
# than once if not needed.
# FIXME: Make LuaRocks faster. I believe this is because we're using the x86_64
# build on Apple Sillicon.
case ";$LUA_PATH;" in
    *";$HOME/.luarocks/share/lua/"*"/?/init.lua;") return 0 ;;
    *) ;;
esac

if ! eval_output luarocks path --no-bin; then
    echo "luarocks: failed to eval luarocks" >&2
    return 1
fi
