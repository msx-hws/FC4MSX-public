# FC4MSX

Floppy Disk Controller cartridge for MSX computers based on the Talent TDC-600 design.

## Previews

| 3D View | Top | Bottom |
| :---: | :---: | :---: |
| ![FC4MSX 3D View](images/pcb-3d.png) | ![FC4MSX Top View](images/pcb-top.png) | ![FC4MSX Bottom View](images/pcb-bottom.png) |

## Where to Buy

Ready-built cartridges and bare PCBs are available at MSX Hardware Store:
- 🛒 **Complete Cartridge:** [FC4MSX Floppy Disk Controller Cartridge](https://msx-hws.nl/cartridges/fc4msx-floppy-disk-controller)
- 🛠️ **Bare PCB:** [FC4MSX Floppy Disk Controller PCB](https://msx-hws.nl/pcbs/pcb-fc4msx-floppy-disk-controller)

## Features

- Standard MSX 50-pin cartridge slot form factor (compatible with MSX, MSX2, MSX2+, turboR).
- Based on the Western Digital WD37C65 floppy disk controller.
- Standard 34-pin header for connecting PC 3.5" floppy drives or Gotek emulators (FlashFloppy).
- Single 27C512 / W27C512 EEPROM for the MSX-DOS Disk ROM.
- Custom 3D printable shell included.

## PCB Fabrication

Ready-to-order Gerbers are available in the [releases](releases/) directory:
- Production package: [FC4MSX-Gerbers-v1.0.3.zip](releases/FC4MSX-Gerbers-v1.0.3.zip)
- Previous releases: [releases/](releases/)

*(If you prefer not to order a batch of PCBs from a fab house, bare PCBs can be purchased individually at [msx-hws.nl](https://msx-hws.nl/pcbs/pcb-fc4msx-floppy-disk-controller).)*

Recommended fabrication parameters:
- Layers: 2
- Board thickness: 1.6 mm
- Surface finish: ENIG (recommended for edge connector contact wear resistance)
- Edge connector: 45° bevel / chamfer

## Bill of Materials

An Interactive BOM is hosted online at:
👉 [**Open Interactive BOM (Live PCB Viewer)**](https://msx-hws.github.io/FC4MSX/bom/ibom.html)

You can also view it locally by opening [bom/ibom.html](bom/ibom.html) in any web browser.

| Ref | Value / Part | Qty | Footprint | Notes |
| :--- | :--- | :---: | :--- | :--- |
| U1 | WD37C65 | 1 | DIP-40 (600 mil) | Floppy Disk Controller |
| U2 | 74LS04 | 1 | DIP-14 (300 mil) | Hex inverter |
| U3 | 74LS138 | 1 | DIP-16 (300 mil) | 3-to-8 decoder |
| U4 | W27C512 | 1 | DIP-28 (600 mil) | TDC-600 MSX-DOS Disk ROM (see `rom/TDC600EN.ROM`) |
| Y1 | 16 MHz | 1 | DIP-8 | Crystal oscillator |
| J1 | MSX Edge | 1 | Card edge | Standard MSX 50-pin slot connector |
| J2 | FDD Header | 1 | 2x17 pin header, 2.54 mm pitch | Standard 34-pin floppy interface |
| C1–C5 | 100 nF | 5 | 2.5 mm pitch | Ceramic decoupling capacitors |
| C6 | 22 µF | 1 | Radial, 2.0 mm pitch, 5 mm dia | Electrolytic capacitor (16V+) |
| R1–R4 | 150 Ω | 4 | Axial DIN0207 | Pull-up resistors |
| R5 | 1 kΩ | 1 | Axial DIN0207 | Resistor |
| JP1–JP4 | Solder jumpers | 4 | 3-pad SMD | Solder bridge configuration pads |

Using quality DIP sockets for U1, U2, U3, and U4 is recommended.

## Disk ROM

A ready-to-burn English Disk ROM binary is provided in the [rom](rom/) directory:
- `rom/TDC600EN.ROM`: 64 KB binary for 27C512 / W27C512.

For flashing instructions and incremental smoke testing (including using a simple cartridge ROM like *Antarctic Adventure* to verify the bus and ROM socket before final assembly), see [docs/ASSEMBLY.md](docs/ASSEMBLY.md).

## 3D Printed Cartridge Shell

Files are located in the [3d-enclosure](3d-enclosure/) directory:
- `FC4MSX-bottom.stl`: Lower shell half.
- `FC4MSX-top.stl`: Upper shell half with opening for the 34-pin cable.
- `FC4MSX.3mf`: Slicer project file with layout and suggested print orientation.

Slicer suggestions:
- Material: PETG or PLA+ (or ABS/ASA)
- Layer height: 0.16–0.20 mm
- Perimeters: 3–4 walls for screw boss rigidity
- Infill: 20–25%

## Usage Notes

1. Connect a 34-pin ribbon cable between J2 and your drive or Gotek emulator.
   - For PC drives or Gotek with FlashFloppy, check drive select jumper settings (typically DS0 / S0 for direct connection). See [docs/PINOUT.md](docs/PINOUT.md).
2. Ensure power is supplied to the floppy drive (e.g. 5V on Gotek).
3. Insert the cartridge with the MSX powered off.
4. Boot the machine with a formatted MSX-DOS disk in the drive.

## Repository Contents

```text
fc4msx/
├── 3d-enclosure/   # Shell STL and 3MF files
├── bom/            # Component list and interactive HTML BOM
├── docs/           # Pinouts and assembly notes
├── gerbers/        # Production Gerber ZIP and drill files
├── images/         # PCB render previews
├── rom/            # Disk ROM binary (TDC600EN.ROM)
├── LICENSE
└── README.md
```

## Credits

- Architecture based on the Talent TDC-600 disk controller.
- MSXmakers for their work on modern TDC-600 adaptations and testing notes.
- Thanks to the MSX Resource Center community for hardware documentation and Disk ROM preservation.

## License

This project is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0).

Commercial manufacturing, distribution, or sale of PCBs, assembled cartridges, or enclosure prints is not permitted without prior approval. For commercial licensing inquiries, contact the author.
