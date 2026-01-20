Download Websites Offline with "HTTrack"
---

- Quick cmds:

Download website and all links, two levels deep:
httrack --mirror url-here -r2

e.g.
httrack --mirror https://easylinuxtipsproject.com/p/ssd.html -r2

- What this cmd does: 
It downloads a website and all its linked pages, up to two levels deep.

- `--mirror` tells HTTrack to download the entire site.
- `-r2` limits the recursion depth to 2 levels from the starting URL.


Useful `httrack` cmds + filters to clean/customize site downloads.

1. Download a site and exclude specific file types 

httrack --mirror https://example.com -r2 -k -v --exclude "*.jpg,*.png,*.css" 

- `-k`: Keep the original directory structure. 
- `-v`: Verbose output. 
- `--exclude`: Exclude specified file types (e.g., images, CSS). 

2. Download only HTML files and ignore images 

httrack --mirror https://example.com -r2 -k -v --exclude "*.jpg,*.png,*.gif"  

3. Download a site and remove specific directories 

httrack --mirror https://example.com -r2 -k -v --exclude "/ads/,/banner/" 

- Exclude directories like `/ads/` or `/banner/` from being downloaded. 

4. Download only main page (no recursion) 

httrack --mirror https://example.com -r0 -k -v 

- `-r0`: No recursion (only the main page). 

5. Download a site and filter out specific URLs  

httrack --mirror https://example.com -r2 -k -v --exclude "https://example.com/ads/*" 

- Exclude all URLs that match the pattern `https://example.com/ads/*`. 
