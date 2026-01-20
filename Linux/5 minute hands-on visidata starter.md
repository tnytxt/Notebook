Here’s a **true 5-minute, hands-on VisiData starter**.
No jargon, no theory — just *open a file, move around, do something useful*.

![Image](https://www.visidata.org/img/woq9DM5lLq-590.jpeg)

![Image](https://www.visidata.org/img/uMj6Dc8W7--719.jpeg)

![Image](https://camo.githubusercontent.com/7ec2b1275eb96fa171e02a5653f2eebc6bdfd8a62ae144cb1cc195bc04fca6c9/687474703a2f2f76697369646174612e6f72672f766964656f732f667265712d6d6f76652d726f772e676966)

![Image](https://www.visidata.org/docs/assets/vd-screenshot-options-colors.png)

## Minute 0–1: Open a file

### Example: a CSV file

```bash
vd data.csv
```

Other common files also work:

```bash
vd data.tsv
vd data.xlsx
vd data.json
vd data.txt
```

👉 If you don’t have a file handy:

```bash
printf "name,age\nAlice,30\nBob,25\n" > test.csv
vd test.csv
```

---

## Minute 1–2: Move around (just like a spreadsheet)

Use **arrow keys**:

* **↑ ↓** → move up/down rows
* **← →** → move left/right columns

That’s it.
If you can move in a spreadsheet, you can move in VisiData.

---

## Minute 2–3: Sort data (most common task)

Move to a column, then:

* **`[`** → sort ascending
* **`]`** → sort descending

Example:

1. Move to the `age` column
2. Press `]`
3. Oldest → youngest instantly

---

## Minute 3–4: Filter rows (very powerful, very simple)

### Keep only rows matching text

Press:

```text
/
```

Type:

```text
Alice
```

Press **Enter**

Now you only see rows containing “Alice”.

To clear the filter:

```text
Esc
```

---

## Minute 4–5: Quick calculations

Move to a **numeric column**, then press:

```text
=
```

VisiData shows:

* sum
* average
* min / max
* count

No formulas. Instant results.

---

## One tiny bonus (very useful)

### Freeze a column (like “Freeze panes”)

Move to a column, press:

```text
!
```

Now it stays visible while you scroll.

---

## The only keys you need to remember today

| Key     | What it does    |
| ------- | --------------- |
| ↑ ↓ ← → | Move around     |
| `[`     | Sort ascending  |
| `]`     | Sort descending |
| `/`     | Filter          |
| `=`     | Column stats    |
| `Esc`   | Cancel / clear  |
| `q`     | Quit            |

That alone covers **80% of daily use**.

---

## If something goes wrong

VisiData is safe:

* Nothing is modified unless you explicitly save
* Press **`q`** to exit
* Press **`Ctrl+C`** if stuck

---

## What would you like next?

I can show:

* 🔹 A **single-screen cheat sheet**
* 🔹 How to **save filtered data to a new file**
* 🔹 How to **combine multiple CSVs**
* 🔹 A **real-world example** (logs, downloads, finance, etc.)

Just tell me what kind of data you usually work with.

