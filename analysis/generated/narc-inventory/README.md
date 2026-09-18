# NARC and member inventory

## Provenance

- Input: `포켓몬스터 하트골드 (Korea, IPKK, header ROM version 0)`
- ROM SHA-256: `659f20ca1d4f43b8b675d3c47217bb875a4f14c62438b08fa42f60467e2bed43`
- Tool: `narc_inventory 1.0.0`
- ROM bytes committed: **no**

## Confirmed totals

| Metric | Count |
| --- | ---: |
| Top-level NARC candidates | 308 |
| Valid top-level NARCs | 308 |
| Malformed top-level NARCs | 0 |
| Nested NARCs | 0 |
| Total members, including nested containers | 56674 |
| Named members | 0 |
| Compression-marker members (Probable or Confirmed) | 6624 |
| Structurally decoded LZ10/LZ11 members (Confirmed) | 4618 |
| Invalid LZ-like leading markers | 546 |
| Huffman/RLE markers not decoded in this phase | 1460 |
| Unknown members | 32414 |

## Evidence language

Offsets, sizes, hashes, block layouts, and successful structural checks are **Confirmed**. A leading magic or compression marker without complete structural validation remains **Probable**. No semantic field names are inferred from payload shape alone.

No raw member payload is retained. `narc-inventory.json` and the CSV files preserve the complete reproducible structure and hash evidence.
