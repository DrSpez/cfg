#!/bin/sh

# requirements:
# file bat

BAT_THEME="Nord"

batorcat() {
    file="$1"
    shift
    if command -v bat >/dev/null 2>&1; then
        bat --color=always --theme="$BAT_THEME" --style=numbers --pager=never "$file" "$@"
    else
        cat "$file"
    fi
}

case "$(file -Lb --mime-type -- "$1")" in
    image/*)
        # TODO: implement
        ;;
    application/pdf)
        # TODO: implement
        ;;
    text/*|application/json)
        batorcat "$1"
        ;;
    *)
        # TODO: implement
        ;;
esac

