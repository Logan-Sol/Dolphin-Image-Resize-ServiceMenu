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
  - HEIF (.heic)
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
    cd Dolphin-Image-Resize-ServiceMenu/

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
