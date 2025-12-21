#!/bin/sh

# requirements:
# file bat poppler

BAT_THEME="Nord"

file="$1"
w="$2"
h="$3"
x="$4"
y="$5"

batorcat() {
    shift
    if command -v bat >/dev/null 2>&1; then
        bat --color=always --theme="$BAT_THEME" --style=numbers --pager=never "$file" "$@"
    else
        cat "$file"
    fi
}

draw() {
  kitten icat --stdin no --transfer-mode memory --place "${w}x${h}@${x}x${y}" "$1" </dev/null >/dev/tty
  exit 1
}

case "$(file -Lb --mime-type -- "$1")" in
    image/*)
        draw "$file"
        ;;
    application/pdf)
        pdftotext "$file" - | sed -n "1,200p" # requires poppler
        ;;
    text/*|application/json)
        batorcat "$1"
        ;;
    *)
        # TODO: implement
        ;;
esac

