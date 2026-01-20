# Regex Filtering in VisiData

VisiData uses **regular expressions** (regex) for powerful row selection, which serves as the foundation for filtering. Selection marks rows temporarily, and you can then create a filtered view. VisiData employs Python-style regex (from the `re` module), which is case-sensitive by default. For case-insensitive matching, add the `(?i)` flag at the start of your pattern.

## Key Commands for Regex-Based Selection

Place your cursor on the column you want to filter by, then use these commands:

- `|` *regex* → Select all rows where the **current column** matches the regex
- `\` *regex* → Unselect all rows where the **current column** matches the regex 
- `g|` *regex* → Select all rows where the regex matches **any visible column**
- `g\` *regex* → Unselect all rows where the regex matches **any visible column**

Selections are additive: run multiple commands to build complex filters (e.g., select one pattern, then another with `g|`).

## Creating a Filtered Sheet

After selecting the desired rows:

- `"` → Open a new duplicate sheet containing **only the selected rows** (this is your filtered view)
- You can also use `t` or `s` to toggle individual rows, or `gs` to select all visible rows.

To clear selections:
- `gu` → Unselect all rows
- `u` → Unselect current row

## Examples

1. **Select rows where a "Name" column starts with "A" (case-insensitive)**
   - Move to the Name column
   - Press `|` then type `(?i)^a` → selects all names starting with A or a

2. **Select rows containing "error" anywhere in the sheet**
   - Press `g|` then type `error`

3. **Select rows where a "Code" column matches specific patterns (e.g., B041 or C023)**
   - Press `|` then type `^B041|^C023`

4. **Complex filter: Items named "Binder" with Units < 10**
   - Move to Item column → `|` type `Binder`
   - Move to Units column (cast as int with `#` first if needed) → `z|` type `Units < 10` (this uses Python expression, not pure regex)

## Related Regex Features

- **Search with regex** (for navigation, not selection):
  - `/` or `?` → Search forward/backward in current column
  - `g/` or `g?` → Search across all visible columns
  - `n` / `N` → Jump to next/previous match

- **Advanced expression selection** (more powerful than pure regex):
  - `z|` *python_expr* → Select rows where a Python expression evaluates to True (column names act as variables)

## Tips

- Regex in VisiData is very efficient, even on large datasets.
- Combine with frequency tables (`Shift+F` on a column) for quick filtering by common values.
- All operations are undoable (if `options.undo` is enabled).
- For more details, press `z Ctrl+H` inside VisiData on any sheet for context-specific commands.

Practice on a sample CSV — regex filtering will quickly become one of your most-used tools! If you have a specific dataset or pattern in mind, share it for tailored examples.
