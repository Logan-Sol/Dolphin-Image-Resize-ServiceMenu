Dolphin Image Resize ServiceMenu

A simple KDE Dolphin ServiceMenu for resizing images directly from the file manager's right-click context menu.

Features
Resize images directly from Dolphin.
Supports common ImageMagick formats including:
PNG
JPEG / JPG
WebP
TIFF
BMP
GIF
Preset resize options:
25%
50%
75%
150%
200%
Original files are never overwritten.
Resized files are saved next to the original.
No kdialog or graphical popup is required.
Works with ImageMagick 6 (convert) and ImageMagick 7 (magick).
Example

Right-click an image in Dolphin:

Resize 25%
Resize 50%
Resize 75%
Resize 150%
Resize 200%


For example:

photo.jpg


Choosing Resize 50% creates:

photo_50pct.jpg


The original remains unchanged.

Requirements
KDE Dolphin
Bash
ImageMagick
Debian / Ubuntu / KDE Neon
sudo apt install imagemagick

Installation

Download image_context_menu.sh, make it executable, and run it:

chmod +x image_context_menu.sh
./image_context_menu.sh


The installer creates:

~/.local/share/kio/servicemenus/Resize-Image.desktop
~/.local/share/dolphin-scripts/resize-image.sh


Dolphin is restarted automatically after installation.

Uninstallation

Remove the installed files with:

rm -f ~/.local/share/kio/servicemenus/Resize-Image.desktop
rm -f ~/.local/share/dolphin-scripts/resize-image.sh


Then restart Dolphin:

killall dolphin 2>/dev/null
dolphin &

How It Works

The Dolphin ServiceMenu passes the selected image files to resize-image.sh together with the requested percentage.

ImageMagick performs the resize:

magick "$file" -resize "${percent}%" "$output"


or, on older ImageMagick installations:

convert "$file" -resize "${percent}%" "$output"


The output filename is generated automatically:

original.jpg
→ original_50pct.jpg

Safety

The tool does not require sudo during normal operation and does not modify the original image.

It only creates files inside the same directory as the selected image.

License

MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files, to deal in the Software
without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
