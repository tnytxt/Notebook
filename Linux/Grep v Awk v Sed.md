Grep vs Awk vs Sed

Grep: Finds and prints lines matching a pattern.  
→ Best for: Simple text search, filtering lines.  
→ Flags: `-i` (ignore case), `-c` (count), `-v` (invert), `-n` (line numbers), `-r` (recursive), `-o` (only match), `-w` (whole word).

**Awk**: Text-processing language. Matches patterns + performs actions (print fields, calculate, conditionals).  
→ Best for: Structured data, reports, field manipulation.  
→ Key: `$1`, `$NF`, `NR`, `BEGIN/END`, `OFS`, conditionals (`$NF>25000`).

**Sed**: Stream editor. Edits text in-place or outputs modified text.  
→ Best for: Find/replace, delete, insert lines.  
→ Syntax: `s/old/new/g`, `3d` (delete line 3), `/pattern/d`, `-n 's//p'` (print only replaced lines).

---

**Use Together**:  
- `grep` to filter → `awk` to extract/transform → `sed` to edit output.  
Example: `grep "manager" test | awk '{print $1,$4}' | sed 's/manager/ops/'`

All 3 are essential for Linux text processing — choose based on task: search (grep), analyze (awk), edit (sed).

---grep — search text
1. Search for a literal string in a file:
   grep "ERROR" /var/log/app.log
2. Case-insensitive search:
   grep -i "timeout" access.log
3. Show line numbers:
   grep -n "TODO" project/*.py
4. Recursive search in directory:
   grep -R "FIXME" ~/projects
5. Show only matching parts:
   grep -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" report.txt
6. Match whole words only:
   grep -w "user" /etc/passwd
7. Invert match (show lines that do NOT match):
   grep -v "^#" config.ini

awk — field processing and simple reports
1. Print whole lines that match a pattern:
   awk '/ERROR/ {print}' /var/log/app.log
2. Print specific fields (default separator is whitespace):
   awk '{print $1, $3}' /var/log/access.log
3. Use a custom field separator (comma) and print columns:
   awk -F',' '{print $2, $4}' users.csv
4. Sum a numeric column (sum column 3):
   awk '{sum += $3} END {print sum}' sales.txt
5. Print lines where column 3 > 100:
   awk '$3 > 100' data.tsv
6. Format output with printf:
   awk '{printf "%-15s %8.2f\n", $1, $2}' prices.txt
7. Print header and count lines:
   awk 'BEGIN {print "Name\tCount"} {counts[$1]++} END {for (n in counts) print n "\t" counts[n]}' items.txt

sed — stream editing (substitute, delete, insert)
1. Replace first occurrence on each line:
   sed 's/foo/bar/' file.txt
2. Replace all occurrences on each line:
   sed 's/foo/bar/g' file.txt
3. In-place edit (modify file directly; backup .bak):
   sed -i.bak 's/old/new/g' README.md
4. Delete lines matching a pattern:
   sed '/^$/d' file.txt            (removes empty lines)
5. Print only a range of lines (lines 10–20):
   sed -n '10,20p' longfile.txt
6. Insert a line before a match:
   sed '/^Chapter 2/i\--- Intro to Chapter 2 ---' book.txt
7. Append a line after a match:
   sed '/^END OF FILE/a\Note: archive this.' notes.txt
8. Replace only on a specific line number (line 5):
   sed '5s/old/new/' file.txt

Combined examples
1. Find lines with "error", show filename:line, then print the 3rd field from the matched lines:
   grep -Rn "error" /var/log | awk -F: '{print $1 ":" $2 " -> " $3}'
2. Replace "foo" with "bar" in all .txt files and preview changes (no -i):
   for f in *.txt; do sed 's/foo/bar/g' "$f" > /tmp/"$f".new && diff -u "$f" /tmp/"$f".new; done
3. Extract 2nd column from CSVs that contain "active":
   grep "active" *.csv | awk -F',' '{print $2}'
4. Show unique sorted values of column 4:
   awk '{print $4}' file | sort | uniq
5. Show top 10 most frequent IPs from access.log:
   awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -10

Quick tips
- Use single quotes around scripts to avoid shell expansion.
- Test sed/awk commands without -i before editing files.
- Pipe tools: let grep filter, awk transform, sed edit.
