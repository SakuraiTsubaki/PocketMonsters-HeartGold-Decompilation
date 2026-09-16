# Analysis: ROM identity baseline

## Target and applicability

This record applies only to the selected 포켓몬스터 하트골드 input identified by the
complete-file hashes below. The user-supplied ROM remains outside Git.

## Claim

The repository target is the Korea Korean Nintendo DS build with
game code `IPKK` and raw header ROM-version byte `0`.
The public project documents US HeartGold and SoulSilver targets, not this Korean localization; independent preservation-catalog matching remains pending.

## Evidence

| Field | Observed value |
| --- | --- |
| Header title | `POKEMON HG` |
| Game code | `IPKK` |
| Maker code | `01` |
| Unit code | `0` |
| Device-capacity exponent | `10` |
| Nominal and actual size | `134217728` bytes |
| Header ROM version | `0` |
| Header CRC-16 | stored `c645`, calculated `c645`, valid |
| SHA-256 | `659f20ca1d4f43b8b675d3c47217bb875a4f14c62438b08fa42f60467e2bed43` |
| SHA-1 | `5834fb3a2d751c48501d47d6a56898d7af6ccf9e` |
| MD5 | `81de94bae7a9033fe077cc885addcfe4` |

## Method

Recorded environment: Windows `10.0.26200`, PowerShell Core `7.6.5`, Python
`3.12.14`. The reusable standard-library tool is maintained in
[`SakuraiTsubaki/Decompilation`](https://github.com/SakuraiTsubaki/Decompilation/tree/a9b6a98ab90304c34b8049cf3c157a9db9045b71/tools/nds_rom_inventory).

```console
python tools/nds_rom_inventory/rom_inventory.py /path/to/input.nds
```

The tool streams the complete file through SHA-256, SHA-1, and MD5; parses the
first 512 bytes; and recalculates the Nintendo DS header CRC over
`0x0000..0x015D`. It does not modify or extract the ROM.

## Findings

- Actual size equals the nominal capacity derived from the header.
- Stored and calculated header CRC values agree.
- The raw ROM-version byte is reported without inferring undocumented content
  differences.
- Public comparison status: **pending** against
  [pret/pokeheartgold](https://github.com/pret/pokeheartgold).

## Confidence

**Confirmed local identity; external match pending.** The complete local hashes and header fields are reproducible and the header CRC is valid. This does not yet establish a match to an independently curated Korean retail-dump record.

## Verification

The observed values are stored in `config/target.json`. Re-running the shared
tool on the selected input must reproduce every complete-file hash and header
field in this record.

## Unknowns

Secure-area validation, ARM9/ARM7 ranges, FNT/FAT, overlay tables, banner,
NitroFS inventory, padding, and per-file hashes remain for the next analysis
unit. An authoritative independent Korean preservation-record match also remains pending.
