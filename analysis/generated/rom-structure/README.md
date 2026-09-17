# ROM structure inventory: 포켓몬스터 하트골드 (Korea, IPKK, header ROM version 0)

## Provenance

- Tool: `nds_rom_analyzer 1.0.0`
- Input basename: `포켓몬스터 하트골드.nds`
- Input SHA-256: `659f20ca1d4f43b8b675d3c47217bb875a4f14c62438b08fa42f60467e2bed43`
- ROM bytes committed: no
- Confidence: **Confirmed** for directly parsed offsets, fields, hashes, and CRC results.

## Core structure

| Field | Value |
| --- | --- |
| Game code | `IPKK` |
| ROM/header size | `134217728` / `16384` bytes |
| ARM9 ROM / RAM / entry / size | `0x4000` / `0x02000000` / `0x02000800` / `765204` |
| ARM7 ROM / RAM / entry / size | `0x2f7a00` / `0x02380000` / `0x02380000` / `161496` |
| FNT / FAT files / directories | `0x31f200` / `511` / `46` |
| ARM9 / ARM7 overlays | `129` / `0` |
| NARC archives | `308` |
| Recognized signatures | `373` |
| Header/logo CRC valid | `True` / `True` |
| Structural validation checks | `True` |
| Secure-area raw encrypted bytes / decrypted CRC validation | `f48185892495ef06316fa4518692ec8999e6cc0c9c740e4ab9f40f1829fc8a91` / `not performed` |

## Outputs

- `structure.json`: complete machine-readable inventory.
- `nitrofs-files.csv`: every FAT file with path, offsets, size, SHA-256, extension, and detected signature.
- `directories.csv`: complete FNT directory table.
- `overlays-arm9.csv` and `overlays-arm7.csv`: complete overlay tables and RAM placement.
- `unreferenced-ranges.csv`: physical gaps and trailing padding. `unreferenced` does not prove unused.

## Reproduction

```console
python tools/nds_rom_analyzer/analyzer.py /path/to/input.nds --output analysis/generated/rom-structure --label "포켓몬스터 하트골드 (Korea, IPKK, header ROM version 0)"
```

## Unknowns

The secure-area bytes and header checksum field are recorded, but decrypted secure-area CRC validation is not performed; a mismatch against CRC of encrypted raw bytes is not corruption evidence. Magic detection identifies only known leading signatures and compression markers. Unknown or extensionless files remain unclassified rather than receiving inferred names. Semantic analysis of NARC members, text, maps, scripts, Pokémon, moves, and items is deferred.
