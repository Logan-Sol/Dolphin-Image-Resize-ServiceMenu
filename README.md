Dolphin Image Resize ServiceMenu

A simple KDE Dolphin ServiceMenu that adds image resizing options to the right-click context menu.

It uses ImageMagick to resize images by percentage without modifying the original file.

Features
Resize images directly from Dolphin's right-click context menu
Supports common ImageMagick formats, including:
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
Original files are never overwritten
Resized images are saved next to the original
No kdialog or graphical popup is required
Supports ImageMagick 7 (magick) and ImageMagick 6 (convert)
Example

Right-click an image in Dolphin and select a resize option:

Resize 25%
Resize 50%
Resize 75%
Resize 150%
Resize 200%


For example:

photo.jpg


Choosing Resize 50% creates:

photo_50pct.jpg


The original image remains unchanged.

Requirements
KDE Dolphin
Bash
ImageMagick
Debian / Ubuntu / KDE Neon

Install ImageMagick with:

sudo apt install imagemagick

Installation

Download image_context_menu.sh, make it executable, and run it:

chmod +x image_context_menu.sh
./image_context_menu.sh


The script creates the following files:

~/.local/share/kio/servicemenus/Resize-Image.desktop
~/.local/share/dolphin-scripts/resize-image.sh


Dolphin is automatically restarted after installation.

Usage

After installation:

Open Dolphin.
Right-click an image.
Choose the desired resize percentage.
The resized image is created in the same directory.

For example:

vacation.png


after selecting Resize 50% becomes:

vacation_50pct.png


The original vacation.png is not modified.

Uninstallation

Remove the installed ServiceMenu and script:

rm -f ~/.local/share/kio/servicemenus/Resize-Image.desktop
rm -f ~/.local/share/dolphin-scripts/resize-image.sh


Then restart Dolphin:

killall dolphin 2>/dev/null
dolphin &

How It Works

image_context_menu.sh installs a KDE Dolphin ServiceMenu and a small resize script.

The ServiceMenu defines the available resize actions:

25%
50%
75%
150%
200%


When an action is selected, Dolphin passes the selected image file(s) to:

~/.local/share/dolphin-scripts/resize-image.sh


The script uses ImageMagick to perform the resize.

ImageMagick 7:

magick "$file" -resize "${percent}%" "$output"


ImageMagick 6:

convert "$file" -resize "${percent}%" "$output"

Multiple Images

Multiple images can be selected in Dolphin and resized together.

Each image receives a new filename based on the selected percentage.

For example:

photo1.jpg
photo2.jpg
photo3.png


with Resize 50% produces:

photo1_50pct.jpg
photo2_50pct.jpg
photo3_50pct.png

Safety

The script does not require sudo during normal operation.

It does not overwrite the original images.

The resized files are created in the same directory as the originals.

No files are downloaded and no network connection is required.

Files

The repository contains:

dolphin-image-resize/
├── README.md
└── image_context_menu.sh


Running image_context_menu.sh creates the required Dolphin ServiceMenu and resize script automatically.

License

MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files, to deal in the Software
without restriction, including without limitation the rights to use, copy,
modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
