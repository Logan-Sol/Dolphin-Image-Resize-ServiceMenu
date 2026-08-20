# Dolphin Image Resize ServiceMenu

A simple KDE Dolphin ServiceMenu that adds image resizing options to the **right-click context menu**.

It uses ImageMagick to resize images by percentage without modifying the original file.

## Features

- Resize images directly from Dolphin
- Preset resize options:
  - **25%**
  - **50%**
  - **75%**
  - **150%**
  - **200%**
- Supports common image formats supported by ImageMagick:
  - PNG
  - JPEG / JPG
  - WebP
  - TIFF
  - BMP
  - GIF
- Original images are never overwritten
- Resized images are saved next to the original
- Supports multiple selected images
- No `kdialog` required
- Works with ImageMagick 7 (`magick`) and ImageMagick 6 (`convert`)
- No `sudo` required for normal operation

## Requirements

- KDE Dolphin
- Bash
- ImageMagick

### Debian / Ubuntu / KDE Neon

Install ImageMagick:

    sudo apt install imagemagick

## Installation

Clone the repository:

    git clone https://github.com/Logan-Sol/Dolphin-Image-Resize-ServiceMenu.git
    cd dolphin-image-resize

Make the installer executable:

    chmod +x image_context_menu.sh

Run it:

    ./image_context_menu.sh

The installer creates:

    ~/.local/share/kio/servicemenus/Resize-Image.desktop
    ~/.local/share/dolphin-scripts/resize-image.sh

Dolphin is automatically restarted after installation.

## Usage

1. Open **Dolphin**.
2. Right-click an image.
3. Select the desired resize percentage.
4. The resized image is created in the same directory.

Available options:

- Resize 25%
- Resize 50%
- Resize 75%
- Resize 150%
- Resize 200%

## Example

Original:

    photo.jpg

After selecting **Resize 50%**:

    photo_50pct.jpg

The original `photo.jpg` remains unchanged.

### Multiple Images

Select multiple images in Dolphin and choose a resize option.

For example:

    photo1.jpg
    photo2.jpg
    drawing.png

After selecting **Resize 50%**:

    photo1_50pct.jpg
    photo2_50pct.jpg
    drawing_50pct.png

## How It Works

The `image_context_menu.sh` script installs two files into your local KDE configuration:

    ~/.local/share/kio/servicemenus/Resize-Image.desktop
    ~/.local/share/dolphin-scripts/resize-image.sh

`Resize-Image.desktop` adds the resize actions to Dolphin's right-click context menu.

`resize-image.sh` performs the actual image resizing using ImageMagick.

For ImageMagick 7, it uses:

    magick "$file" -resize "${percent}%" "$output"

For older ImageMagick installations, it uses:

    convert "$file" -resize "${percent}%" "$output"

## Output Files

The original file is never overwritten.

The resized file gets the percentage added to its filename:

    original.jpg
    original_25pct.jpg
    original_50pct.jpg
    original_75pct.jpg
    original_150pct.jpg
    original_200pct.jpg

## Uninstallation

Remove the installed ServiceMenu and resize script:

    rm -f ~/.local/share/kio/servicemenus/Resize-Image.desktop
    rm -f ~/.local/share/dolphin-scripts/resize-image.sh

Then restart Dolphin:

    killall dolphin 2>/dev/null
    dolphin &

## Repository Structure

    dolphin-image-resize/
    ├── README.md
    └── image_context_menu.sh

The installer creates the required Dolphin ServiceMenu and resize script automatically.

## Notes

This project is intended for normal image resizing. ImageMagick determines the exact behavior for individual image formats.

Animated images and multi-page image formats may have format-specific behavior.

## License

MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
