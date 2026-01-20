### get_iplayer install and use 

#### Docs
https://github.com/get-iplayer/get_iplayer/wiki

#### Install
https://github.com/get-iplayer/get\_iplayer/wiki/installation

[for debian](https://software.opensuse.org/download.html?project=home%3Am-grant-prg&package=get-iplayer)

or

`echo 'deb http://download.opensuse.org/repositories/home:/m-grant-prg/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/home:m-grant-prg.list
curl -fsSL https://download.opensuse.org/repositories/home:m-grant-prg/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_m-grant-prg.gpg > /dev/null
sudo apt update
sudo apt install get-iplayer`


#### Usage

`get_iplayer --help`   
`get_iplayer --basic-help`   
`get_iplayer --long-help`

#### Examples

[](https://github.com/get-iplayer/get_iplayer#examples)

*   List all TV programmes (`--type=tv` set by default):
    
    `get_iplayer ".*"`   
    
    
    Search output appears in this format:
    
    ```
      ...
      208:  Doctor Who: Series 7 Part 2 - 1. The Bells of Saint John, BBC One, b01rryzz
      209:  Doctor Who: Series 7 Part 2 - 2. The Rings Of Akhaten, BBC One, b01rx0lj
      210:  Doctor Who: Series 7 Part 2 - 3. Cold War, BBC One, b01s1cz7
      ...
    ```
    
    Format = `<index>: <name> - <episode>, <channel>, <pid>`
    
*   List all TV programmes with long descriptions:
    
    `get_iplayer --long ".*"`
    
*   List all radio programmes:
    
    `get_iplayer --type=radio ".*"`
    
*   List all TV programmes with "doctor who" in the name (matching is case-insensitive):
    
    `get_iplayer "doctor who"`
    
*   List all TV and radio programmes with "doctor who" in the name:
    
    `get_iplayer --type tv,radio "doctor who"`
    
*   List all BBC One programmes:
    
    `get_iplayer --channel="BBC One" ".*"`
    
*   List Radio 4 and Radio 4 Extra programmes with "Book at Bedtime" in the title:
    
    `get_iplayer --type=radio --channel="Radio 4" "Book at Bedtime"`
    
*   List only Radio 4 programmes with "Book at Bedtime" in the title:
    
    `get_iplayer --type=radio --channel="Radio 4$" "Book at Bedtime"`
    
    _(The `$` regular expression metacharacter matches "Radio 4" only at the end of the channel name, thus avoiding matches against "Radio 4 Extra")_
    
*   Record TV programme number 208 (index from search results) in HD, with fallback to lower quality if not available:
    
    `get_iplayer --get 208` \[default setting\]
    
    or
    
    `get_iplayer --get 208 --tv-quality=hd,sd,web,mobile` \[explicit setting\]
    
*   Record TV programme number 208 in lower resolution only (704x396@50):
    
    `get_iplayer --get 208 --tv-quality=web`
    
*   Record TV programme number 208 and download subtitles in SubRip (SRT) format:
    
    `get_iplayer --get 208 --subtitles`
    
*   Record multiple TV programmes (using index numbers from search results):
    
    `get_iplayer --get 208 209 210`
    
*   Record a TV programme using its iPlayer URL:
    
    `get_iplayer https://www.bbc.co.uk/iplayer/episode/b01sc0wf/Doctors_Series_15_Perfect/`
    
*   Record a TV programme using the PID (b01sc0wf) from its iPlayer URL:
    
    `get_iplayer --pid=b01sc0wf`
    
*   Record a radio programme using its Sounds URL:
    
    `get_iplayer https://www.bbc.co.uk/sounds/play/b07gcv34`
    
*   Record a radio programme using the PID (b07gcv34) from its Sounds URL in high quality (320k), with fallback to lower quality if not available (default setting):
    
    `get_iplayer --pid=b07gcv34` \[default setting\]
    
    OR
    
    `get_iplayer --pid=b07gcv34 --radio-quality=high,std,med,low` \[explicit setting\]
    
*   Record a radio programme using the PID (b07gcv34) from its Sounds URL with lower bit rate only (96k):
    
    `get_iplayer --pid=b07gcv34 --radio-quality=med`
    
*   Record multiple radio programmes (using PIDs from Sounds URLs):
    
    `get_iplayer --pid=b07gcv34,b07h60ld` \[comma-separated list\]
    
    OR
    
    `get_iplayer --pid=b07gcv34 --pid=b07h60ld` \[multiple arguments\]
    

NOTE: Sometimes you may not be able to download a listed programme immediately after broadcast (usually available within 24hrs of airing). Some BBC programmes may not be available from iPlayer/Sounds