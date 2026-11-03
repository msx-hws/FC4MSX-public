# Disk ROM

This directory contains the Disk ROM binary for the FC4MSX controller:

- `TDC600EN.ROM`: 64 KB (65,536 bytes) English Disk ROM image, ready to burn directly into a 27C512 EPROM or W27C512 EEPROM.

## Flashing Instructions

1. Insert your 27C512 / W27C512 into an EPROM programmer (e.g. Minipro TL866II Plus / T48).
2. Ensure the chip is blank (or run an erase cycle if using an EEPROM or UV eraser for windowed EPROM).
3. Load `TDC600EN.ROM` into the programmer software at buffer address `0x0000`.
4. Program and verify the chip.
