# Ambil
Ambil is simple downloader tool with runtime configuration, similar to wget but simpler and easier to use.
One notable difference is the ability to automatically put downloaded file to a directory
based on config. For example you can instruct `Ambil` to always put (after download is complete) mp3 files
to `~/mp3` directory.

## Installation
```
git clone https://github.com/sendyhalim/Yomu
make install
```

## Usage
```
ambil https://raw.githubusercontent.com/sendyhalim/Yomu/master/Resources/screenshot.png
```


## Example config
```
# Create ambil runtime configuration in your home directory
vim ~/.ambil
```

This configuration make ambil to put (you can use regex too :beers:!)
- every file that has extension `.mp3` in `~/Downloads/music`
- every file that has extension `.jpg` in `~/Downloads/pictures`

```
[
  {
    "extension": ".mp3",
    "directory": "~/Downloads/music"
  },
  {
    "extension": ".jpg",
    "directory": "~/Downloads/pictures"
  }
]
```
