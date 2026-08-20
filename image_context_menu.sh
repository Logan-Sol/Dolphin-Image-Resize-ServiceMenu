#!/usr/bin/env bash

set -e

BASE="$HOME/.local/share"
SERVICES="$BASE/kio/servicemenus"
SCRIPTS="$BASE/dolphin-scripts"

mkdir -p "$SERVICES" "$SCRIPTS"

# Check ImageMagick
if command -v magick >/dev/null 2>&1; then
    :
elif command -v convert >/dev/null 2>&1; then
    :
else
    echo "ImageMagick is not installed."
    echo "Install it with:"
    echo "  sudo apt install imagemagick"
    exit 1
fi

# --------------------------------------------------
# Create the resize script
# --------------------------------------------------

printf '%s\n' \
'#!/usr/bin/env bash' \
'' \
'set -u' \
'' \
'percent="$1"' \
'shift' \
'' \
'if command -v magick >/dev/null 2>&1; then' \
'    IMAGEMAGICK=(magick)' \
'elif command -v convert >/dev/null 2>&1; then' \
'    IMAGEMAGICK=(convert)' \
'else' \
'    exit 1' \
'fi' \
'' \
'for file in "$@"; do' \
'    dir=$(dirname "$file")' \
'    name=$(basename "$file")' \
'    stem="${name%.*}"' \
'    ext="${name##*.}"' \
'' \
'    output="$dir/${stem}_${percent}pct.${ext}"' \
'' \
'    "${IMAGEMAGICK[@]}" "$file" -resize "${percent}%" "$output"' \
'done' \
> "$SCRIPTS/resize-image.sh"

chmod +x "$SCRIPTS/resize-image.sh"

# --------------------------------------------------
# Create Dolphin ServiceMenu
# --------------------------------------------------

printf '%s\n' \
'[Desktop Entry]' \
'Type=Service' \
'ServiceTypes=KonqPopupMenu/Plugin' \
'MimeType=image/*' \
'Actions=Resize25;Resize50;Resize75;Resize150;Resize200' \
'' \
'[Desktop Action Resize25]' \
'Name=Resize 25%' \
"Exec=$SCRIPTS/resize-image.sh 25 %F" \
'Icon=transform-scale' \
'' \
'[Desktop Action Resize50]' \
'Name=Resize 50%' \
"Exec=$SCRIPTS/resize-image.sh 50 %F" \
'Icon=transform-scale' \
'' \
'[Desktop Action Resize75]' \
'Name=Resize 75%' \
"Exec=$SCRIPTS/resize-image.sh 75 %F" \
'Icon=transform-scale' \
'' \
'[Desktop Action Resize150]' \
'Name=Resize 150%' \
"Exec=$SCRIPTS/resize-image.sh 150 %F" \
'Icon=transform-scale' \
'' \
'[Desktop Action Resize200]' \
'Name=Resize 200%' \
"Exec=$SCRIPTS/resize-image.sh 200 %F" \
'Icon=transform-scale' \
> "$SERVICES/Resize-Image.desktop"

# --------------------------------------------------
# Restart Dolphin
# --------------------------------------------------

killall dolphin 2>/dev/null || true
sleep 1
dolphin >/dev/null 2>&1 &

echo
echo "Image resize ServiceMenu installed."
echo
echo "Available options:"
echo "  Resize 25%"
echo "  Resize 50%"
echo "  Resize 75%"
echo "  Resize 150%"
echo "  Resize 200%"
