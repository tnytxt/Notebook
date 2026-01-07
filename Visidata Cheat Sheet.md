# VisiData Cheat Sheet

VisiData is a powerful, keyboard-driven terminal tool for exploring, cleaning, and analyzing tabular data (CSV, TSV, JSON, Excel, SQLite, etc.). It feels like a spreadsheet in the terminal but is much faster for large datasets.

## Launch VisiData

- vd filename.csv      → Open a file
- vd                   → Open current directory (DirSheet)
- cat data.csv | vd    → Pipe data in

## Quit

- q         → Quit current sheet (most common)
- Q         → Quit and free memory
- Ctrl+Q    → Force quit everything

## Help

- Ctrl+H         → Open help menu
- z Ctrl+H       → Show commands available on current sheet
- g Ctrl+H       → Show all commands (searchable with /)
- Space          → Open command palette (fuzzy search by longname)

## Navigation

- h j k l or arrow keys → Move left/down/up/right
- gh gj gk gl           → Jump to leftmost/bottom/top/rightmost column/row
- Home / End or gg / G  → Top / bottom of sheet
- Ctrl+B / Ctrl+F       → Page up / page down
- / or ?                → Search forward/backward in current column (regex)
- g/ or g?              → Search forward/backward across all columns
- n / N                 → Next / previous match
- Tab                   → Cycle through open sheets or panes

## Selection (mark rows for bulk operations)

- s      → Toggle select current row
- gs     → Toggle select all rows
- u      → Unselect current row
- gu     → Unselect all rows
- t      → Toggle select current row
- ,      → Select all rows matching current cell value
- "      → Duplicate sheet with only selected rows

## Sorting & Filtering

- [              → Sort ascending by current column
- ]              → Sort descending by current column
- g[ / g]        → Sort by all key columns (useful for stable sort)
- | or \ regex   → Select rows matching regex in current column
- g| / g\ regex  → Select rows matching regex anywhere
- "              → Duplicate sheet with selected rows only

## Editing

- e              → Edit current cell
- ge             → Edit current column for all selected rows (set same value)
- d              → Delete current/selected row(s)
- a              → Append a new blank row
- ga + number    → Append that many blank rows
- U / R          → Undo / redo (enable via options.undo = True if needed)

## Columns

- Shift+C                  → Open Columns Sheet (rename, hide, reorder, set type)
- Space + resize-column    → Auto-resize current column
- -                        → Hide current column
- g-                       → Hide all columns except current
- Shift+[ / Shift+]        → Move column left/right

## Summarizing & Aggregating

- Shift+F on a column → Frequency table (counts unique values)
- Shift+W             → Describe sheet (stats like mean, median)
- Shift+P             → Pivot table (group and aggregate)
- .                   → Plot current numeric column as histogram

## Save & Export

- Ctrl+S       → Save current sheet (as TSV by default)
- z Ctrl+S     → Save current column only
- Ctrl+Y       → Copy current row to clipboard
- g Ctrl+Y     → Copy selected rows to clipboard

## Metasheets (powerful tools)

- Shift+S → Sheets Sheet (manage/join sheets)
- Shift+O → Options Sheet (change settings)
- Shift+C → Columns Sheet
- Shift+D → Command log (record/replay workflows)

## Tips for Beginners

- Use hjkl like in Vim for fast navigation.
- Press Space to fuzzy-search commands by name (e.g., type "sort" to find sorting commands).
- Everything is undoable (if enabled).
- For more, press z Ctrl+H on any sheet to see context-specific commands.
- Check the official quick reference: Ctrl+H → Quick Reference Guide.

## Great Next Steps

- Follow Jeremy Singer-Vine's excellent beginner tutorial: https://jsvine.github.io/intro-to-visidata/
- Press Space + open-guide-index inside VisiData for built-in guides (new in recent versions).

Practice with a small CSV file — you'll quickly get the hang of it! If you have a specific task (e.g., filtering, pivoting), let me know for tailored commands.
