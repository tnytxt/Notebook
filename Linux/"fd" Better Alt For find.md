## What else find can do (high-level)

- Search by name, case-insensitive: **-name / -iname**
- Search by type: **-type f|d|l|c|b|p|s**
- Search by size: **-size +1M / -size -100k / -size 10c**
- Time-based filters: **-mtime / -mmin / -atime / -cmin**
- Permissions / owner / group: **-perm / -user / -group**
- Combine tests: boolean operators **( ) -a -o !** (escape parentheses in shell)
- Execute actions on matches:
  - **-exec command {} \;** (per-file)
  - **-exec command {} +** (batch multiple paths)
  - **-execdir** (run in the file’s directory)
  - **-delete** (remove matched files/dirs)
- Output control:
  - **-print, -printf** (custom output formatting)
  - **-print0** for NUL-separated output (safe with xargs -0)
- Content searches:
  - With **-exec grep -Hn {} +** to search file contents
- Depth control:
  - **-maxdepth N** and **-mindepth N**
- File tests:
  - **-empty, -readable, -writable, -executable, -size, -links**
- Advanced: Links, inode, filesystem boundaries:
  - **-inum, -samefile, -fstype, -xdev**
- Combining with xargs or parallel for performance.

---

## Examples (concise)
- Find and delete empty dirs:
  /usr/bin/find . -type d -empty -delete
- Find files >100MB and list human sizes:
  find / -type f -size +100M -exec ls -lh {} +
- Find modified in last hour and grep content:
  find . -type f -mmin -60 -exec grep -H "TODO" {} +
- Print path, size, and mtime:
  find . -type f -printf "%p %s %TY-%Tm-%Td %TH:%TM:%TS\n"

---

## Better alternatives (when to use them)

- fd (https://github.com/sharkdp/fd)
  - Much faster than find for common name/regex searches.
  - Simpler defaults (ignores .gitignore, colorized).
  - Syntax: fd PATTERN [path]
  - Use when you mainly need fast name-based searches.

- ripgrep (rg) — for content search
  - Extremely fast recursive grep; respects .gitignore.
  - Use when searching file contents, not metadata.

- fdfind (Debian/Ubuntu name for fd) / fd features:
  - Supports executing commands via --exec, printing, parallelism.

- find + parallel / xargs / GNU parallel
  - For heavy post-processing, pair find with xargs or GNU parallel to speed up actions.

- visually-oriented tools:
  - NCurses file managers (ranger, nnn) for interactive browsing.

- locate / mlocate
  - Blazing-fast name lookup via an indexed database (updatedb).
  - Use for quick name lookups across filesystem; not suitable for very recent files.

---

## Quick recommendations
- For everyday name searches: use **fd** (simpler, faster).
- For content searches: use **rg** (ripgrep).
- For complex metadata queries or precise control (permissions, time, -execdir, -delete): stick with **find**.
- Combine tools: e.g., use fd to get paths quickly and pipe to xargs/rg/find for complex checks.

If you tell me what kinds of searches or operations you do most (size/time/content/permission/etc.), I’ll suggest precise find or fd commands.
