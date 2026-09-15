# ARM9 `NitroMain` analysis

## Verified target
- Game: Pokémon HeartGold
- Game code: `IPKK`
- Region/language: Korea / Korean
- ROM identity: `manifests/rom-baseline.json`

## Entry and boundary
- `_start` loads `0x02000CA5`; bit 0 selects Thumb state.
- `NitroMain` Thumb entry: `0x02000CA4`.
- Observed main-function instruction/literal boundary: `0x02000CA4..0x02000E47`.
- Literal pool begins at `0x02000E48`.
- Code span size: `0x1A4` (420) bytes.
- SHA-256 of that observed code span: `3b8c5e07cbec84c34bb2e35318228273861830d106c0bc0ad20cb1d8f6f4cd65`.
- Call sites in the observed body: 53 total, including one register-indirect `BLX` callback site.

## Matched high-level flow
The Korean HeartGold target follows the `pret/pokeheartgold` `NitroMain` structure: system/graphics/input initialization, backlight, 3D buffer-swap request state, RTC and overlay-manager initialization, fonts, save data, sound/timer setup, WFC/save checks, first-overlay selection from the reset parameter, RNG/brightness setup, timer/tick startup, then the permanent frame loop.

The frame loop includes communication/reset checks, overlay-manager execution, system task queues, VBlank waits and counters, RTC updates, 3D buffer-swap handling, brightness/fade updates, VBlank callback dispatch, sound, and the V-wait task queue.

## HG/SS comparison
HeartGold and SoulSilver use the same `NitroMain` entry and the same 420-byte boundary, but their observed bodies are not byte-identical. Twelve bytes differ in this span. The differences are concentrated in encoded call targets whose target addresses move between the two binaries; the surrounding control-flow structure is retained.

Examples already observed include HeartGold targets such as `0x020DBAA8`, `0x0202D0F8`, `0x0203A280`, and `0x0203AF18`, with the corresponding SoulSilver targets shifted to nearby addresses.

## Evidence
- Local Korean HeartGold ROM disassembly.
- Direct local comparison with the Korean SoulSilver target.
- Cross-check: `pret/pokeheartgold`, `src/main.c` and startup assembly.

## Next mapping pass
1. Build HG↔SS address correspondence for every direct call in `NitroMain`.
2. Resolve confirmed function names from the HG/SS reconstruction lineage.
3. Follow intro-title and main-menu overlay paths.
4. Extend the correspondence method through all 129 ARM9 overlays.
