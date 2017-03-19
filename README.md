# Ambil
`Ambil` is a simple downloader tool with runtime configuration, similar to wget but simpler and easier to use.
One nice feature of `Ambil` is that you can configure where `Ambil` should put your downloaded file based on
file extension, filename patterns and many more (coming soon~)! For example you can instruct `Ambil` to
always put (after download is complete) mp3 files to `~/Downloads/mp3` directory.

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

This configuration make `Ambil` to put (you can use regex too :beers:!)
- every file that has extension `.mp3` in `~/Downloads/music`
- every file that has extension `.jpg` or `.png` in `~/Downloads/pictures`

```
[
  {
    "extension": ".mp3",
    "directory": "~/Downloads/music"
  },
  {
    "pattern": "(.jpg|.png)",
    "directory": "~/Downloads/pictures"
  }
]
```


## Testing
```
make test
```
