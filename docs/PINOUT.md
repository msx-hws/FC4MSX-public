# FC4MSX Pinout & Cable Guide

## MSX 50-Pin Cartridge Slot
The cartridge plugs into a standard MSX / MSX2 / MSX2+ / turboR 50-pin slot.
Standard pinout conforms to the MSX cartridge expansion bus specification.

## Floppy Disk Interface (34-Pin Header)
The 34-pin dual-row header uses standard Shugart / PC floppy pinout conventions.

### Standard 34-Pin Ribbon Cable Pinout:
| Pin (Odd) | Signal | Pin (Even) | Signal |
| :--- | :--- | :--- | :--- |
| 1 | GND | 2 | /DENSITY SELECT (or NC) |
| 3 | GND | 4 | /IN USE (or NC) |
| 5 | GND | 6 | DRIVE SELECT 3 |
| 7 | GND | 8 | /INDEX |
| 9 | GND | 10 | DRIVE SELECT 0 |
| 11 | GND | 12 | DRIVE SELECT 1 |
| 13 | GND | 14 | DRIVE SELECT 2 |
| 15 | GND | 16 | /MOTOR ON |
| 17 | GND | 18 | /DIRECTION |
| 19 | GND | 20 | /STEP |
| 21 | GND | 22 | /WRITE DATA |
| 23 | GND | 24 | /WRITE GATE |
| 25 | GND | 26 | /TRACK 00 |
| 27 | GND | 28 | /WRITE PROTECT |
| 29 | GND | 30 | /READ DATA |
| 31 | GND | 32 | /SIDE 1 SELECT |
| 33 | GND | 34 | /DISK CHANGE / READY |

> **Note on Drive Select (DS0 vs DS1):**
> - Standard PC floppy drives are usually jumpered as **DS1** by default and require a cable twist for Drive A:.
> - For straight cables or Gotek drives, ensure your drive jumper is set to match the controller output (commonly **DS0** or **S0** on Gotek / FlashFloppy).
