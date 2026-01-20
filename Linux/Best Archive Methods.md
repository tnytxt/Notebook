- Default/best balance: **tar.zst**
  - Fast compression/decompression, good ratios, modern support.

- Maximum compression (size): **.7z**
  - Best size, much slower compression; use when time/CPU is acceptable.

- High compression but slow: **tar.xz**
  - Often better ratio than zst, significantly slower to compress.

- Maximum compatibility/ubiquity: **tar.gz**
  - Fast, very portable, larger files.

Quick commands:
- `tar.zst: tar -c --use-compress-program="zstd -19 --format=zstd" -f archive.tar.zst dir/`
- `tar.gz: tar -czf archive.tar.gz dir/`
- `tar.xz: tar -cJf archive.tar.xz dir/`
- `7z: 7z a archive.7z dir/`


#Linux
