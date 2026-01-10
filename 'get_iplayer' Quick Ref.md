# get_iplayer Quick Reference (2025/26)

## Quick Start
- Download single programme  
  `get_iplayer --pid=xxxxxxxx`

- Download multiple programmes  
  `get_iplayer --pid=xxxxxxxx, xxxxxxxx, xxxxxxxx `

- Download whole series
  `get_iplayer --pid-recursive=xxxxxxxx`

Docs: https://github.com/get-iplayer/get_iplayer/wiki

## Installation (pick one)

**Option 1** – Recommended (latest from GitHub)  
→ https://github.com/get-iplayer/get_iplayer/wiki/installation

**Option 2** – openSUSE binary (simple)  
→ https://software.opensuse.org/download.html?project=home%3Am-grant-prg&package=get-iplayer

**Option 3** – Debian/Ubuntu via repo  
```bash
echo 'deb http://download.opensuse.org/repositories/home:/m-grant-prg/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/home:m-grant-prg.list
curl -fsSL https://download.opensuse.org/repositories/home:m-grant-prg/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_m-grant-prg.gpg >/dev/null
sudo apt update
sudo apt install get-iplayer
```

## Useful Help Commands
```bash
get_iplayer --help          # very short
get_iplayer --basic-help    # most useful options
get_iplayer --long-help     # everything
```

## Most Common Search Examples

Search everything (TV by default):  
`get_iplayer ".*"`

TV only + long descriptions:  
`get_iplayer --long ".*"`

Radio only:  
`get_iplayer --type=radio ".*"`

Doctor Who (anywhere in name – case insensitive):  
`get_iplayer "doctor who"`

Doctor Who – TV + Radio:  
`get_iplayer --type=tv,radio "doctor who"`

Only BBC One:  
`get_iplayer --channel="BBC One" ".*"`

Book at Bedtime – Radio 4 only (exact channel):  
`get_iplayer --type=radio --channel="Radio 4$" "Book at Bedtime"`

## Downloading / Recording

**By search index** (from list above)  
`get_iplayer --get 208`  
`get_iplayer --get 208 209 210`

**Best quality HD + fallback**  
`get_iplayer --get 208`  
or explicit: `--tv-quality=hd,sd,web,mobile`

Lower quality only (good for space):  
`--tv-quality=web`

With subtitles:  
`--get 208 --subtitles`

**By PID** (from URL)  
`get_iplayer --pid=b01rryzz`  
`get_iplayer --pid=b07gcv34`

**Whole series by PID**  
`get_iplayer --pid-recursive=b01xxxxy`

**Radio – best quality + fallback**  
`get_iplayer --pid=b07gcv34`  
or explicit: `--radio-quality=high,std,med,low`

Radio lower quality only (96k):  
`--radio-quality=med`

Multiple PIDs:  
`get_iplayer --pid=b07gcv34,b07h60ld`  
or  
`get_iplayer --pid=b07gcv34 --pid=b07h60ld`

**Direct URL** (very convenient):  
`get_iplayer https://www.bbc.co.uk/iplayer/episode/b01sc0wf/...`  
`get_iplayer https://www.bbc.co.uk/sounds/play/b07gcv34`

Good luck & happy archiving! 📼📻
